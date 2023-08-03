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
    
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    
    let logoutButton = UIButton(type: .custom)
    
    var isAuthenticated = true
    var userProfile = Profile.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if isAuthenticated {
            
            let urlString = userProfile.picture
                if let profilePicture = URL(string: urlString) {
                    profileImageView.imageFrom(url: profilePicture)
                } else {
                    print("Invalid URL string")
                }

            nameLabel.text = userProfile.name
            nicknameLabel.text = userProfile.nickname
            emailLabel.text = userProfile.email
        }
        
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
            logoutButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30) // Distance from email
            
        ])
    }
    
    
    //MARK: - Navigation
    @objc func logoutButtonTapped() {
        
        logout()
        
        self.performSegue(withIdentifier: "unwindToHomeSegue", sender: self)
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
                    self.isAuthenticated = false
                }
            }
    }
}


//MARK: - Extensions

// Extension of UIImageView to convert url to image
extension UIImageView{
  func imageFrom(url:URL){
    DispatchQueue.global().async { [weak self] in
      if let data = try? Data(contentsOf: url){
        if let image = UIImage(data:data){
          DispatchQueue.main.async{
            self?.image = image
          }
        }
      }
    }
  }
}
