//
//  DiagnosisViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class DiagnosisViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    let animationButtonColor = UIColor(red: 79/255.0, green: 163/255.0, blue: 255/255.0, alpha: 1.0)  // #4fa3ff color
    
    let diagnosisLabel = UILabel()
    
    let termsButton = UIButton(type: .custom)
    
    var termsModalView: TermsModalView!
    
    var diagnosis: String? {
        didSet {
            DispatchQueue.main.async {
                self.diagnosisLabel.text = self.diagnosis ?? "No diagnosis"
            }
        }
    }
    
    // Create a semi-transparent overlay view
    lazy var overlayView: UIView = {
        let overlay = UIView(frame: view.bounds)
        overlay.backgroundColor = UIColor(white: 0, alpha: 0.5)
        overlay.alpha = 0.0
        return overlay
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Diagnosis label
        diagnosisLabel.text = diagnosis ?? "No diagnosis" // Set the label text to the diagnosis if available, otherwise, show "No diagnosis"
        diagnosisLabel.font = UIFont(name: "Lato-Regular", size: 20.0)
        diagnosisLabel.textColor = UIColor.black
        
        diagnosisLabel.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(diagnosisLabel)
        
        // Terms & Conditions button
        termsButton.setTitle("Terms & Conditions", for: .normal)
        termsButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 14.0)
        termsButton.setTitleColor(.white, for: .normal)
        termsButton.setTitleColor(self.animationButtonColor, for: .highlighted)
        
        termsButton.backgroundColor = skinsightColor
        termsButton.layer.cornerRadius = 10.0
        
        termsButton.translatesAutoresizingMaskIntoConstraints = false
        
        termsButton.addTarget(self, action: #selector(termsTapped), for: .touchUpInside)
        
        view.addSubview(termsButton)
        
        // Create the custom modal view and hide it initially
        termsModalView = TermsModalView()
        termsModalView.translatesAutoresizingMaskIntoConstraints = false
        termsModalView.alpha = 0.0
        
        view.addSubview(termsModalView)
        
        // Accept button
        termsModalView.acceptButton.addTarget(self, action: #selector(acceptTapped), for: .touchUpInside)
        
        // Add the overlay view before the modal view
        view.insertSubview(overlayView, belowSubview: termsModalView)
        
        
        // Set Auto Layout Constraints
        NSLayoutConstraint.activate([

            // Image View Constraints
            imageView.widthAnchor.constraint(equalToConstant: 250),
            imageView.heightAnchor.constraint(equalToConstant: 250),
            
            // Diagnosis label Constraints
            diagnosisLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            diagnosisLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 30),
            
            // Terms & Conditions button Constraints
            termsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -40),
            termsButton.widthAnchor.constraint(equalToConstant: 150),
            termsButton.heightAnchor.constraint(equalToConstant: 30),
            
            // Terms & Conditions modal Constraints
            termsModalView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            termsModalView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            termsModalView.widthAnchor.constraint(equalToConstant: 330),
            termsModalView.heightAnchor.constraint(equalToConstant: 350),

        ])
    }
    
    @objc func termsTapped() {
        
        // Show the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 1.0
        }
        
        // Show the modal view with animation and bring it to the front
        UIView.animate(withDuration: 0.3) {
            self.termsModalView.alpha = 1.0
        }
        view.bringSubviewToFront(termsModalView)
    }
    
    @objc func acceptTapped() {
        // Hide the overlay view with animation
        UIView.animate(withDuration: 0.3) {
            self.overlayView.alpha = 0.0
        }
        
        // Hide the modal view with animation
        UIView.animate(withDuration: 0.3) {
            self.termsModalView.alpha = 0.0
        }
    }
}
