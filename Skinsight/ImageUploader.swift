import UIKit

class ImageUploader {
    func uploadImage(image: UIImage, filename: String, completion: @escaping (Bool, Error?) -> Void) {
        guard let imageData = image.jpegData(compressionQuality: 0.5) else {
            completion(false, nil)
            return
        }

        let urlString = "https://739c-35-225-126-248.ngrok.io/file" // Replace this with your actual API endpoint URL

        guard let url = URL(string: urlString) else {
            completion(false, nil)
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"

        let boundary = "Boundary-\(UUID().uuidString)"
        let contentType = "multipart/form-data; boundary=\(boundary)"
        request.setValue(contentType, forHTTPHeaderField: "Content-Type")

        let imageDataKey = "file" // Change the field name to "file"

        var body = Data()
        body.append("--\(boundary)\r\n".data(using: .utf8)!)
        body.append("Content-Disposition: form-data; name=\"\(imageDataKey)\"; filename=\"\(filename)\"\r\n".data(using: .utf8)!)
        body.append("Content-Type: image/jpeg\r\n\r\n".data(using: .utf8)!) // Specify the image content type
        body.append(imageData)
        body.append("\r\n--\(boundary)--\r\n".data(using: .utf8)!)

        request.httpBody = body

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // ... (rest of the code remains the same)
        }
        print("URL: \(urlString)")
        print("Content-Type: \(contentType)")
        print("Body: \(String(data: body, encoding: .utf8) ?? "No Body Data")")

        task.resume()
    }
}
