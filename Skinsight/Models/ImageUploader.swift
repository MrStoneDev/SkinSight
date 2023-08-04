import UIKit

class ImageUploader {
    // This function is used to upload an image to a server.
    func uploadImage(image: UIImage, filename: String, completion: @escaping (Result<String, Error>) -> Void) {
        // Convert the UIImage into JPEG data with a compression quality of 0.5.
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(.failure(NSError(domain: "ImageError", code: 0, userInfo: nil)))
            return
        }
        let apiUrl = "https://6d4e-35-247-118-94.ngrok.io" // Replace this with your actual API URL.
        
        let urlString = "\(apiUrl)/file" // Concatenate to construct the URL for the API endpoint to upload the image.

        // Create a URL object from the constructed URL string.
        guard let url = URL(string: urlString) else {
            completion(.failure(NSError(domain: "URLError", code: 0, userInfo: nil)))
            return
        }
        
        // Create a URLRequest object for the POST request to the API endpoint.
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        // This is required when uploading files.
        let boundary = "Boundary-\(UUID().uuidString)"
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")
        
        let imageDataKey = "file" // Set the key in the multipart request.
        
        // Create the body of the multipart request.
        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(imageDataKey)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!) // Specify the image content type
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)
        
        request.httpBody = body // Set the body of the request.
        
        // Create a URLSession data task to send the request to the server.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let data = data,
               let responseString = String(data: data, encoding: .utf8) {
                // If the request is successful and data is received, call the completion block with the response string.
                completion(.success(responseString))
            } else {
                completion(.failure(NSError(domain: "APIError", code: 0, userInfo: nil)))
            }
        }

        task.resume() // Start the data task to send the request.
    }
}
