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
        
        // App's name Label
        let nameLabel = UILabel()
        nameLabel.text = "SkinSight"
        nameLabel.font = UIFont(name: "Lato-Regular", size: 32.0)
        nameLabel.textColor = skinsightColor
        nameLabel.frame = CGRect(x: 142, y: 449, width: 200, height: 40)
        self.view.addSubview(nameLabel)

        // Slogan Label
        let sloganLabel = UILabel()
        sloganLabel.text = "Discover, protect, prevent:\nSkinSight, the power of AI\nskin detection"
        sloganLabel.font = UIFont(name: "Lato-Regular", size: 18.0)
        sloganLabel.textColor = skinsightColor
        sloganLabel.numberOfLines = 3
        sloganLabel.textAlignment = .center
        sloganLabel.frame = CGRect(x: 92, y: 520, width: 231, height: 70)
        self.view.addSubview(sloganLabel)

        // Sign In Button
        let signInButton = UIButton(type: .custom)
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signInButton.backgroundColor = skinsightColor
        signInButton.layer.cornerRadius = 20
        signInButton.frame = CGRect(x: 130, y: 670, width: 150, height: 38)
        self.view.addSubview(signInButton)

        // Sign Up Button
        let signUpButton = UIButton(type: .custom)
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        signUpButton.setTitleColor(skinsightColor, for: .normal)
        signUpButton.layer.cornerRadius = 15
        signUpButton.layer.borderColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0).cgColor
        signUpButton.layer.borderWidth = 1
        signUpButton.frame = CGRect(x: 130, y: 730, width: 150, height: 38)
        self.view.addSubview(signUpButton)

    }
    
}
