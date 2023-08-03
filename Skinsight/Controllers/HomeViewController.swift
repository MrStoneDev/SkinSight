//
//  HomeViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit
import Auth0

// This is the controller class of the Home screen.
class HomeViewController: UIViewController {
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var isAuthenticated = false
//    var userProfile = Profile.empty
    
    // Create the buttons
    let signInButton = UIButton(type: .custom)
    let signUpButton = UIButton(type: .custom)
    
    // Set the required colors to have a more readable code
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
        
        // Button actions
        signInButton.addTarget(self, action: #selector(signInButtonTouchDown), for: .touchDown)
        signInButton.addTarget(self, action: #selector(signInButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(signInButton) // Add the button to the screen
        
        // Set Auto Layout Constraints
        NSLayoutConstraint.activate([
            signInButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signInButton.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: 50), // Distance from the top label
            signInButton.widthAnchor.constraint(equalToConstant: 150), // Width constraint
            signInButton.heightAnchor.constraint(equalToConstant: 40), // Height constraint
        ])
    }
    
    
    //MARK: - Navigation
    
    @objc func signInButtonTapped() {
    
        login()
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
    
    
    //MARK: - Auth0
    private func login() {
        Auth0.webAuth().start { result in
            switch result {
            case .failure(let error):
                // The user pressed "Cancel" on Universal login
                // or something unusual happened.
                print("Failed with: \(error)")
                self.isAuthenticated = false // Set to false in case of failure
            case .success(let credentials):
                self.isAuthenticated = true // Set to true upon successful login
                Profile.setupSharedInstance(credentials.idToken)

                // Perform the segue
                self.performSegue(withIdentifier: "HomeToTabSegue", sender: self)
            }
        }
    }
}
