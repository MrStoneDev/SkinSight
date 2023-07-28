//
//  HomeViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    let signInButton = UIButton(type: .custom)
    let signUpButton = UIButton(type: .custom)
    
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    let animationButtonColor = UIColor(red: 79/255.0, green: 163/255.0, blue: 255/255.0, alpha: 1.0)  // #4fa3ff color
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sign In Button
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signInButton.backgroundColor = skinsightColor
        signInButton.layer.cornerRadius = 20
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false // Important to use Auto Layout
        
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        signInButton.addTarget(self, action: #selector(signInButtonTouchDown), for: .touchDown)
        
        self.view.addSubview(signInButton)
        

        // Sign Up Button
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signUpButton.setTitleColor(skinsightColor, for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderColor = skinsightColor.cgColor
        signUpButton.layer.borderWidth = 1
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false // Important to use Auto Layout
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
        
        self.view.addSubview(signUpButton)
        
        // Set Auto Layout Constraints
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signInButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50), // Distance from the top label
            signInButton.widthAnchor.constraint(equalToConstant: 150), // Width constraint
            signInButton.heightAnchor.constraint(equalToConstant: 40), // Height constraint
            
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signUpButton.topAnchor.constraint(equalTo: signInButton.bottomAnchor, constant: 20), // Distance from the sign-in button
            signUpButton.widthAnchor.constraint(equalToConstant: 150), // Width constraint
            signUpButton.heightAnchor.constraint(equalToConstant: 40), // Height constraint
        ])
    }
    
    
    //MARK: - Navigation
    
    @objc func signInButtonTapped() {
        // Trigger the segue to the Sign In view controller
        performSegue(withIdentifier: "SignInSegue", sender: self)
    }

    @objc func signUpButtonTapped() {
        // Trigger the segue to the Sign Up view controller
        performSegue(withIdentifier: "SignUpSegue", sender: self)
    }
    
    
    //MARK: - Buttons animation
    
    // Handle touch down events to change the text color temporarily
    @objc func signInButtonTouchDown() {
        signInButton.setTitleColor(self.animationButtonColor, for: .normal)
        
        // Revert the color change after 0.25 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.signInButton.setTitleColor(.white, for: .normal)
        }
    }

    @objc func signUpButtonTouchDown() {
        signUpButton.setTitleColor(self.animationButtonColor, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.signUpButton.setTitleColor(self.skinsightColor, for: .normal)
        }
    }
    
}
