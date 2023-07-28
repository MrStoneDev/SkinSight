//
//  SignUpViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var pleaseLabel: UILabel!
    @IBOutlet weak var orLabel: UILabel!
    
    let grayColor = UIColor(red: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)
    let borderColor = UIColor(red: 163.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0)
    let skinsightColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0) // #146C94 color
    let animationButtonColor = UIColor(red: 79/255.0, green: 163/255.0, blue: 255/255.0, alpha: 1.0)  // #4fa3ff color
    
    let signUpButton = UIButton(type: .custom)
    let toSignInButton = UIButton()
    
    let lineSeparator = UIView(frame: CGRect(x: 118, y: 645, width: 180, height: 1))
    
    let accountLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User Text Field
        let userTextField = createTextField(frame: CGRect(x: 67, y: 293, width: 280, height: 55), placeholder: "Username")
        userTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let userLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        userTextField.leftView = userLeftPaddingView
        userTextField.leftViewMode = .always
        
        view.addSubview(userTextField)

        
        // E-mail Text Field
        let emailTextField = createTextField(frame: CGRect(x: 67, y: 370, width: 280, height: 55), placeholder: "E-mail")
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let emailLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        emailTextField.leftView = emailLeftPaddingView
        emailTextField.leftViewMode = .always
        
        view.addSubview(emailTextField)

        
        // Password Text Field
        let passwordTextField = createTextField(frame: CGRect(x: 67, y: 447, width: 280, height: 55), placeholder: "Password")
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let passwordLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        passwordTextField.leftView = passwordLeftPaddingView
        passwordTextField.leftViewMode = .always
        
        view.addSubview(passwordTextField)
        
        
        // Sign up Button
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        signUpButton.backgroundColor = blueColor
        signUpButton.layer.cornerRadius = 20
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTouchDown), for: .touchDown)
        
        self.view.addSubview(signUpButton)
        
        
        // Separator
        lineSeparator.backgroundColor = borderColor
        lineSeparator.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(lineSeparator)
        
        
        // "Sign up with Google" button
        let signUpGoogle = createCustomButton(imageName: "google_icon", title: "Sign up with Google", position: CGPoint(x: 67, y: 680))
        signUpGoogle.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(signUpGoogle)

        
        // "Sign up with Facebook" button
        let signUpFacebook = createCustomButton(imageName: "facebook_icon", title: "Sign up with Facebook", position: CGPoint(x: 67, y: 730))
        signUpFacebook.translatesAutoresizingMaskIntoConstraints = false
        
        self.view.addSubview(signUpFacebook)
        
        
        // Account label
        accountLabel.text = "Already have an\naccount?"
        accountLabel.numberOfLines = 2
        
        accountLabel.font = UIFont(name: "Lato-Regular", size: 14.0)
        accountLabel.translatesAutoresizingMaskIntoConstraints = false
       
        self.view.addSubview(accountLabel)
        
        
        // toSignIn button
        toSignInButton.setTitle("Sign in", for: .normal)
        toSignInButton.setTitleColor(blueColor, for: .normal)
        
        toSignInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 14.0)
        toSignInButton.translatesAutoresizingMaskIntoConstraints = false
        
        toSignInButton.addTarget(self, action: #selector(toSignInButtonTapped), for: .touchUpInside)
        toSignInButton.addTarget(self, action: #selector(toSignInButtonTouchDown), for: .touchDown)
        
        self.view.addSubview(toSignInButton)
         
        // Set the view controller as the delegate for the text fields
        userTextField.delegate = self
        passwordTextField.delegate = self

        // Add a tap gesture recognizer to dismiss the keyboard
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        
        // Set Auto Layout Constraints
        NSLayoutConstraint.activate([
            // User Text Field Constraints
            userTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            userTextField.topAnchor.constraint(equalTo: pleaseLabel.bottomAnchor, constant: 40), // Distance from pleaseLabel
            userTextField.widthAnchor.constraint(equalToConstant: 280),
            userTextField.heightAnchor.constraint(equalToConstant: 55),
            
            // E-mail Text Field Constraints
            emailTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            emailTextField.topAnchor.constraint(equalTo: userTextField.bottomAnchor, constant: 20), // Distance from user
            emailTextField.widthAnchor.constraint(equalToConstant: 280),
            emailTextField.heightAnchor.constraint(equalToConstant: 55),
            
            // Password Text Field Constraints
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 20), // Distance from email
            passwordTextField.widthAnchor.constraint(equalToConstant: 280),
            passwordTextField.heightAnchor.constraint(equalToConstant: 55),
            
            // Sign up Button Constraints
            signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 35), // Distance from password
            signUpButton.widthAnchor.constraint(equalToConstant: 150),
            signUpButton.heightAnchor.constraint(equalToConstant: 40),
            
            // Or Label Constraints
            orLabel.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 35), // Distance from signup button
            
            // Separator Constraints
            lineSeparator.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            lineSeparator.topAnchor.constraint(equalTo: orLabel.bottomAnchor, constant: 5), // Distance from Or label
            lineSeparator.widthAnchor.constraint(equalToConstant: 190),
            lineSeparator.heightAnchor.constraint(equalToConstant: 1),
            
            // "Sign up with Google" button Constraints
            signUpGoogle.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signUpGoogle.topAnchor.constraint(equalTo: lineSeparator.bottomAnchor, constant: 35), // Distance from line separator
            signUpGoogle.widthAnchor.constraint(equalToConstant: 280),
            signUpGoogle.heightAnchor.constraint(equalToConstant: 40),
            
            // "Sign up with Facebook" button Constraints
            signUpFacebook.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            signUpFacebook.topAnchor.constraint(equalTo: signUpGoogle.bottomAnchor, constant: 10), // Distance from google
            signUpFacebook.widthAnchor.constraint(equalToConstant: 280),
            signUpFacebook.heightAnchor.constraint(equalToConstant: 40),
            
            // Account label Constraints
            accountLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor), // Center horizontally
            accountLabel.topAnchor.constraint(equalTo: signUpFacebook.bottomAnchor, constant: 20), // Distance from facebook
            
            // toSignIn button Constraints
            toSignInButton.topAnchor.constraint(equalTo: signUpFacebook.bottomAnchor, constant: 35), // Distance from facebook
            toSignInButton.leftAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            toSignInButton.widthAnchor.constraint(equalToConstant: 50),
            toSignInButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    
    //MARK: - Create TextField
    func createTextField(frame: CGRect, placeholder: String) -> UITextField {
        let textField = UITextField(frame: frame)
        textField.backgroundColor = grayColor
        textField.placeholder = placeholder
        textField.layer.cornerRadius = 10.0
        textField.font = UIFont(name: "Roboto", size: 15)
        
        return textField
    }
    
    
    //MARK: - Create CustomButton
    func createCustomButton(imageName: String, title: String, position: CGPoint) -> UIButton {
        var config = UIButton.Configuration.plain()
        config.image = UIImage(named: imageName)
        config.imagePlacement = .leading
        config.imagePadding = 20
        
        let button = UIButton(type: .custom)
        button.configuration = config
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont(name: "Inter-Regular", size: 10.0)
        button.setTitleColor(.black, for: .normal)
        button.layer.cornerRadius = 12
        button.layer.borderColor = borderColor.cgColor
        button.layer.borderWidth = 1
        button.frame = CGRect(origin: position, size: CGSize(width: 280, height: 40))
        return button
    }
    
    
    //MARK: - Navigation
    
    @objc func toSignInButtonTapped() {
        // Trigger the segue to the Sign Up view controller
        performSegue(withIdentifier: "toSignInSegue", sender: self)
    }
    
    
    //MARK: - Buttons animation
    
    @objc func signUpButtonTouchDown() {
        signUpButton.setTitleColor(self.animationButtonColor, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.signUpButton.setTitleColor(.white, for: .normal)
        }
    }
    
    @objc func toSignInButtonTouchDown() {
        toSignInButton.setTitleColor(self.animationButtonColor, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.15) {
            self.toSignInButton.setTitleColor(self.skinsightColor, for: .normal)
        }
    }
    
    
    //MARK: - Dismiss Keyboard
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // This method gets called when the "Return" key is pressed on the keyboard
        textField.resignFirstResponder()
        return true
    }
}
