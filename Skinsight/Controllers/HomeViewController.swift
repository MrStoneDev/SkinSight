//
//  HomeViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    let signInButton = UIButton(type: .custom)
    let signUpButton = UIButton(type: .custom)
    
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Sign In Button
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        signInButton.backgroundColor = skinsightColor
        signInButton.layer.cornerRadius = 20
        signInButton.frame = CGRect(x: 130, y: 670, width: 150, height: 40)
        
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
        signUpButton.frame = CGRect(x: 130, y: 730, width: 150, height: 40)
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
        
        self.view.addSubview(signUpButton)

    }
    
    @objc func signInButtonTapped() {
        // Trigger the segue to the Sign In view controller
        performSegue(withIdentifier: "SignInStoryboard", sender: self)
    }

    @objc func signUpButtonTapped() {
        // Trigger the segue to the Sign Up view controller
        performSegue(withIdentifier: "SignUpStoryboard", sender: self)
    }
    
    // Handle touch down events to change the text color temporarily
    @objc func signInButtonTouchDown() {
        signInButton.setTitleColor(.cyan, for: .normal)
        
        // Revert the color change after 0.25 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.signInButton.setTitleColor(.white, for: .normal)
        }
    }

    @objc func signUpButtonTouchDown() {
        signUpButton.setTitleColor(.cyan, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.signUpButton.setTitleColor(self.skinsightColor, for: .normal)
        }
    }
    
}
