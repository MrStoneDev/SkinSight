//
//  ScanViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let circleButton = CircleButtonWithCross(frame: CGRect(x: 0, y: 0, width: 47, height: 47))
    var customModalView: CustomModalView!
    
    let imageView = UIImageView()
    let imagePicker = UIImagePickerController()
    let cameraPicker = UIImagePickerController()
    
    let imageUploader = ImageUploader()
    let uploadButton = UIButton(type: .system)
    
    // Create a semi-transparent overlay view
    lazy var overlayView: UIView = {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
        overlay.alpha = 0.0
        return overlay
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the imageView
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // Set up the imagePicker for photo library
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        
        // Set up the imagePicker for camera
        cameraPicker.delegate = self
        cameraPicker.sourceType = .camera
        
        // Circular button
        circleButton.center = view.center
        circleButton.addTarget(self, action: #selector(circleButtonTapped), for: .touchUpInside)
        view.addSubview(circleButton)
        
        // Create the custom modal view and hide it initially
        customModalView = CustomModalView(frame: CGRect(x: 45, y: 200, width: 330, height: 350))
        customModalView.alpha = 0.0
        view.addSubview(customModalView)
        
        // Add the overlay view before the modal view
        view.insertSubview(overlayView, belowSubview: customModalView)
        
        uploadButton.setTitle("Upload Image", for: .normal)
        uploadButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        uploadButton.frame = CGRect(x: 60, y: 520, width: 200, height: 50)
        view.addSubview(uploadButton)
        
    }

    @objc func circleButtonTapped() {
        // Show the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1.0
        }
        
        // Show the modal view with animation and bring it to the front
        UIView.animate(withDuration: 0.3) {
            self.customModalView.alpha = 1.0
        }
        view.bringSubviewToFront(customModalView)
        
        // Update label text
        customModalView.updateLabelText(text: "Upload the\nimage you want\nto be scanned")
        
        // Add actions to buttons
        customModalView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        customModalView.takePhotoButton.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        customModalView.selectImageButton.addTarget(self, action: #selector(selectImageButtonTapped), for: .touchUpInside)
    }
    
    @objc func takePhotoButtonTapped() {
        present(cameraPicker, animated: true, completion: nil)
    }
    
    @objc func selectImageButtonTapped() {
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
    
    @objc func closeButtonTapped() {
        // Hide the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 0.0
        }
        
        // Hide the modal view with animation
        UIView.animate(withDuration: 0.3) {
            self.customModalView.alpha = 0.0
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