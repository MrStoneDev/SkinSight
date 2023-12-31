//
//  ScanViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

// This is the controller class for the Scan screen.
class ScanViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // Connection from Storyboard.
    @IBOutlet weak var startLabel: UILabel!
    
    // Create UI Elements programmatically.
    let imageUploader = ImageUploader()
    var updateModalView: UpdateModalView!
    
    let circleButton = CircleButtonWithCross(frame: CGRect(x: 0, y: 0, width: 47, height: 47))
    
    let imageView = UIImageView()
    
    let imagePicker = UIImagePickerController()
    let cameraPicker = UIImagePickerController()
    
    let uploadButton = UIButton(type: .system)
    
    // Create a semi-transparent overlay view.
    lazy var overlayView: UIView = {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
        overlay.alpha = 0.0
        return overlay
    }()
    
    // Create a loader.
    lazy var loaderView: UIActivityIndicatorView = {
        let loader = UIActivityIndicatorView(style: .large)
        loader.color = UIColor(named: "skinsightColor")
        loader.hidesWhenStopped = true
        loader.translatesAutoresizingMaskIntoConstraints = false
        return loader
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set up the imageView
        imageView.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
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
        updateModalView = UpdateModalView(frame: CGRect(x: 45, y: 200, width: 330, height: 350))
        updateModalView.alpha = 0.0
        updateModalView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(updateModalView)
        
        // Add the overlay view before the modal view
        view.insertSubview(overlayView, belowSubview: updateModalView)
        
        uploadButton.setTitle("Upload Image", for: .normal)
        uploadButton.tintColor = UIColor(named: "buttonsColor")
        
        uploadButton.translatesAutoresizingMaskIntoConstraints = false
        uploadButton.addTarget(self, action: #selector(uploadImage), for: .touchUpInside)
        
        view.addSubview(uploadButton)
        
        // Loader
        view.addSubview(loaderView)
        
        // Set Auto Layout Constraints
        NSLayoutConstraint.activate([
            
            // Image view Constraints
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            imageView.bottomAnchor.constraint(equalTo: uploadButton.topAnchor, constant: -40), // Distance from upload button
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            // Upload button Constraints
            uploadButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            uploadButton.topAnchor.constraint(equalTo: circleButton.bottomAnchor, constant: 40), // Distance from + button
            uploadButton.widthAnchor.constraint(equalToConstant: 100),
            uploadButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Update modal Constraints
            updateModalView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            updateModalView.centerYAnchor.constraint(equalTo: view.centerYAnchor), // Center vertically
            updateModalView.widthAnchor.constraint(equalToConstant: 330),
            updateModalView.heightAnchor.constraint(equalToConstant: 350),
            
            // Loader Constraints
            loaderView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loaderView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 5),
        ])
        
    }
    
    
    //MARK: - Button actions
    
    @objc func circleButtonTapped() {
        // Show the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1.0
        }
        
        // Show the modal view with animation and bring it to the front
        UIView.animate(withDuration: 0.3) {
            self.updateModalView.alpha = 1.0
        }
        view.bringSubviewToFront(updateModalView)
        
        // Add actions to buttons
        updateModalView.closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        updateModalView.takePhotoButton.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        updateModalView.selectImageButton.addTarget(self, action: #selector(selectImageButtonTapped), for: .touchUpInside)
    }
    
    @objc func takePhotoButtonTapped() {
        present(cameraPicker, animated: true, completion: nil) // Open the camera.
    }
    
    @objc func selectImageButtonTapped() {
        present(imagePicker, animated: true, completion: nil) // Open the photo library.
    }
    
    @objc func closeButtonTapped() {
        // Hide the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 0.0
        }
        
        // Hide the modal view with animation
        UIView.animate(withDuration: 0.3) {
            self.updateModalView.alpha = 0.0
        }
    }
    
    
    //MARK: - Helper methods
    
    // Delegate method to handle image selection from the imagePicker
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let selectedImage = info[.originalImage] as? UIImage {
            imageView.image = selectedImage
            circleButton.isHidden = true // Hide the circleButton
            startLabel.isHidden = true // Hide the startLabel
        }
        picker.dismiss(animated: true, completion: nil)
        
        // Close the modal automatically after image selection
        closeButtonTapped()
    }
    
    // Helper function to upload the selected image.
    @objc func uploadImage() {
        guard let image = imageView.image else {
            print("Please select an image first.")
            return
        }
        
        // Show the loader
        loaderView.startAnimating()
        
        let filename = "uploaded_image.jpg" // You can choose a different filename if needed
        imageUploader.uploadImage(image: image, filename: filename) { result in
            
            switch result {
            case .success(let responseString):
                // Parse the JSON response and extract the diagnosis
                let diagnosis = self.extractDiagnosis(from: responseString)

                // Switch to the Diagnosis tab and pass the diagnosis and selectedImage on the main thread
                DispatchQueue.main.async {
                    // Hide the loader regardless of the result
                    self.loaderView.stopAnimating()
                    
                    if let tabBarController = self.tabBarController,
                       let diagnosisViewController = tabBarController.viewControllers?[0] as? DiagnosisViewController {
                        diagnosisViewController.diagnosis = diagnosis
                        diagnosisViewController.imageView.image = image
                        tabBarController.selectedIndex = 0 // Switch to the first tab (index 0) where DiagnosisViewController is located
                        // Show the circleButton and startLabel again when the uploadButton is tapped
                        self.circleButton.isHidden = false
                        self.startLabel.isHidden = false
                        self.imageView.image = nil
                    }
                }

            case .failure(let error):
                // Display an error message using an alert on the main thread
                DispatchQueue.main.async {
                    let alertController = UIAlertController(title: "Error", message: error.localizedDescription, preferredStyle: .alert)
                    alertController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                    self.present(alertController, animated: true, completion: nil)
                }
            }
        }
    }
    
    
    // Helper method to extract the diagnosis from the JSON response
    private func extractDiagnosis(from responseString: String) -> String {
        guard let data = responseString.data(using: .utf8) else {
            return responseString
        }
        
        do {
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
               let resultArray = json["result"] as? [String] {
                
                // Check if the resultArray contains at least two elements (the two values in the tuple)
                if resultArray.count >= 2 {
                    let diagnosis = resultArray[1] // Get the second value from the tuple
                    return diagnosis
                }
            }
        } catch {
            return responseString
        }
        
        // If the extraction fails, return the original responseString
        return responseString
    }
}
