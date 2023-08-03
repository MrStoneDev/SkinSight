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
    
    // Create the connections from Storyboard
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleNameLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nicknameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    
    // Colors to use
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    let animationButtonColor = UIColor(red: 79/255.0, green: 163/255.0, blue: 255/255.0, alpha: 1.0)  // #4fa3ff color
    
    let profileImageView = RoundedImageView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
    let logoutButton = UIButton(type: .custom)
    
    var isAuthenticated = true // Boolean variable to check authentication.
    var userProfile = Profile.shared // Instance of the Profile class.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
            
        if isAuthenticated { // Check if the condition is met
            
            // Transform the string from the google account picture to a string
            let urlString = userProfile.picture
                if let profilePicture = URL(string: urlString) {
                    profileImageView.imageFrom(url: profilePicture) // Set the converted picture to the imageView.
                    
                    // Round the corners
                    profileImageView.layer.cornerRadius = profileImageView.frame.size.width / 2.0
                    profileImageView.clipsToBounds = true
                    
                    profileImageView.translatesAutoresizingMaskIntoConstraints = false
                    
                    self.view.addSubview(profileImageView)
                } else {
                    print("Invalid URL string")
                }
            
            // Set the elements with the account data.
            nameLabel.text = userProfile.name
            nicknameLabel.text = userProfile.nickname
            emailLabel.text = userProfile.email
        }
        
        // Logout button
        logoutButton.setTitle("Log out", for: .normal)
        logoutButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        logoutButton.backgroundColor = skinsightColor
        logoutButton.layer.cornerRadius = 20
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        logoutButton.addTarget(self, action: #selector(logoutButtonTouchDown), for: .touchDown)
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        self.view.addSubview(logoutButton)
        
        // Constraints
        NSLayoutConstraint.activate([
            
            // Profile image
            profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            profileImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20), // Distance from the label
            profileImageView.widthAnchor.constraint(equalToConstant: 200),
            profileImageView.heightAnchor.constraint(equalToConstant: 200),
            
            // Title Name label
            titleNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 30),
            
            // Logout button
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            logoutButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 30), // Distance from email
            logoutButton.widthAnchor.constraint(equalToConstant: 150), // Width constraint
            logoutButton.heightAnchor.constraint(equalToConstant: 40), // Height constraint
        ])
    }
    
    
    //MARK: - Navigation
    @objc func logoutButtonTapped() {
        
        logout()
        
        self.performSegue(withIdentifier: "unwindToHomeSegue", sender: self) // Go back to the home screen
    }
    
    
    //MARK: - Button animation
    // Handle touch down events to change the text color temporarily
    @objc func logoutButtonTouchDown() {
        logoutButton.setTitleColor(self.animationButtonColor, for: .normal)
        
        // Revert the color change after 0.25 second
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.logoutButton.setTitleColor(.white, for: .normal)
        }
    }

    
    
    //MARK: - Auth0
    private func logout() {
        
        Auth0
            .webAuth()
            .clearSession { result in // Clear the Auth0 session
                
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
