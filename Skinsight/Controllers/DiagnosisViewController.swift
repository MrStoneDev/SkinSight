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
        diagnosisLabel.textAlignment = .center
        diagnosisLabel.numberOfLines = 0 // Allow multiple lines
        diagnosisLabel.setContentCompressionResistancePriority(.required, for: .vertical)
        
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
            diagnosisLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            diagnosisLabel.widthAnchor.constraint(equalToConstant: 250),
            diagnosisLabel.heightAnchor.constraint(equalToConstant: 100),
            
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
    
    //MARK: - Buttons actions
    
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
        
        // Set the large text for the largeTextLabel in the modal view
        let largeText = "Introduction\n\nWelcome to our mobile application focused on health. By downloading and using our app, you agree to the following terms and conditions.\n\nUse of the App\n\nOur app uses AI technology to analyze images of skin conditions and detect the possibility of benign diseases, such as skin cancer. By using our app, you agree to allow us to access your camera, location, and other user data, such as age, gender, and the images you take.\n\nPrivacy Policy\n\nWe take your privacy seriously and will only use your data for the purpose of improving our service. We may collect and use your data to train our AI to be more accurate in detecting diseases. We will not share your data with any third parties without your consent.\n\nDisclaimer\n\nOur app is not a substitute for professional medical advice and should not be used as such. The results of our analysis are based on AI technology and should be confirmed by a medical professional.\n\nAcceptance of Terms\n\nBy downloading and using our app, you acknowledge that you have read and agree to these terms and conditions. If you do not agree to these terms and conditions, please do not use our app.\n\nContact Us\n\nIf you have any questions or concerns about our app or these terms and conditions, please contact us at mario.alvarado.isw@gmail.com"
        
        termsModalView.largeTextLabel.text = largeText
        
        // Update the scrollView's contentSize to fit the largeTextLabel's content
        termsModalView.scrollView.contentSize = CGSize(width: termsModalView.largeTextLabel.frame.width, height: termsModalView.largeTextLabel.frame.height + 40)
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
