//
//  ProfileViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let signInButton = UIButton(type: .custom)
        let blueColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)
        
        signInButton.setTitle("Profile", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        signInButton.backgroundColor = blueColor
        signInButton.layer.cornerRadius = 20
        signInButton.frame = CGRect(x: 130, y: 535, width: 150, height: 40)
        
        self.view.addSubview(signInButton)
    }
}
