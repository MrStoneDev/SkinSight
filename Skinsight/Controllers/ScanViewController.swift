//
//  ScanViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class ScanViewController: UIViewController {
    
    let circleButton = CircleButtonWithCross(frame: CGRect(x: 0, y: 0, width: 47, height: 47))
    var customModalView: CustomModalView!
    
    // Create a semi-transparent overlay view
    lazy var overlayView: UIView = {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
        overlay.alpha = 0.0
        return overlay
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        customModalView.uploadImageButton.addTarget(self, action: #selector(uploadImageButtonTapped), for: .touchUpInside)
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
    
    @objc func takePhotoButtonTapped() {
        // Add your code for handling the "Take a photo" button action here
    }
    
    @objc func uploadImageButtonTapped() {
        // Add your code for handling the "Upload an image" button action here
    }
}
