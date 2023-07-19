//
//  HomeViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color

        // Sign In Button
        let signInButton = UIButton(type: .custom)
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signInButton.backgroundColor = skinsightColor
        signInButton.layer.cornerRadius = 20
        signInButton.frame = CGRect(x: 130, y: 670, width: 150, height: 40)
        self.view.addSubview(signInButton)

        // Sign Up Button
        let signUpButton = UIButton(type: .custom)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signUpButton.setTitleColor(skinsightColor, for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderColor = skinsightColor.cgColor
        signUpButton.layer.borderWidth = 1
        signUpButton.frame = CGRect(x: 130, y: 730, width: 150, height: 40)
        self.view.addSubview(signUpButton)

    }
    
}
