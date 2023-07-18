import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    let imagePicker = UIImagePickerController()
    let imageView = UIImageView()
    let imageUploader = ImageUploader()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Set up the imageView
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)

        // Set up the imagePicker
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary

        // Add a button for image selection
        let selectImageButton = UIButton(type: .system)
        selectImageButton.setTitle("Select Image", for: .normal)
        selectImageButton.addTarget(self, action: #selector(selectImage), for: .touchUpInside)
        selectImageButton.frame = CGRect(x: 50, y: 350, width: 200, height: 50)
        view.addSubview(selectImageButton)

        // Add a button for image uploading
        let uploadButton = UIButton(type: .system)
        uploadButton.setTitle("Upload Image", for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        uploadButton.frame = CGRect(x: 50, y: 420, width: 200, height: 50)
        view.addSubview(uploadButton)
    }

    @objc func selectImage() {
        present(imagePicker, animated: true, completion: nil)
    }

    @objc func uploadImage() {
        guard let image = imageView.image else {
            print("Please select an image first.")
            return
        }

        let filename = "uploaded_image.jpg" // You can choose a different filename if needed

        imageUploader.uploadImage(image: image, filename: filename) { success, error in
            if success {
                print("Image uploaded successfully!")
            } else if let error = error {
                print("Error uploading image: \(error.localizedDescription)")
            } else {
                print("Unknown error occurred while uploading image.")
            }
        }
    }

    // Delegate method to handle image selection from the imagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
        }
        picker.dismiss(animated: true, completion: nil)
    }
}

