//
//  ProfileViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 22/07/23.
//

import UIKit
import Auth0

// This is the controller class for the Profile screen.
class ProfileViewController: UIViewController {
    
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    
    let logoutButton = UIButton(type: .custom)
    var userProfile = Profile.empty
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        logoutButton.backgroundColor = skinsightColor
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        // Button actions
//        logoutButton.addTarget(self, action: #selector(signInButtonTouchDown), for: .touchDown)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(logoutButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor) // Center vertically
            
        ])
    }
    
    //MARK: - Navigation
    @objc func logoutButtonTapped() {
        
        logout()
        
        self.performSegue(withIdentifier: "LogoutSegue", sender: self)
    }
    
    
    //MARK: - Auth0
    private func logout() {
        
        Auth0
            .webAuth()
            .clearSession { result in
                
                switch result {
                     
                case .failure(let error):
                    print("Failed with error \(error)")
                
                case .success:
                    
                    print("Eh vegetta eres el mejor youtuber")
                }
            }
    }
}
