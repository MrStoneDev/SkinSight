//
//  SignInViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 19/07/23.
//

import UIKit

class SignInViewController: UIViewController {
    
    let grayColor = UIColor(red: 232.0/255.0, green: 232.0/255.0, blue: 232.0/255.0, alpha: 1.0)
    let blueColor = UIColor(red: 20/255.0, green: 108/255.0, blue: 148/255.0, alpha: 1.0)
    let borderColor = UIColor(red: 163.0/255.0, green: 148.0/255.0, blue: 148.0/255.0, alpha: 1.0)

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // User Text Field
        let userTextField = createTextField(frame: CGRect(x: 67, y: 293, width: 280, height: 55), placeholder: "Username")
        
        let userLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        userTextField.leftView = userLeftPaddingView
        userTextField.leftViewMode = .always
        
        view.addSubview(userTextField)
        
        // Password Text Field
        let passwordTextField = createTextField(frame: CGRect(x: 67, y: 370, width: 280, height: 55), placeholder: "Password")
        
        let passwordLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        passwordTextField.leftView = passwordLeftPaddingView
        passwordTextField.leftViewMode = .always
        
        view.addSubview(passwordTextField)
        
        // Forgot password button
        let forgotPasswordButton = UIButton()
        
        forgotPasswordButton.setTitle("tap here", for: .normal)
        forgotPasswordButton.setTitleColor(blueColor, for: .normal)
        
        forgotPasswordButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 14.0)
        forgotPasswordButton.frame = CGRect(x: 183, y: 485, width: 51, height: 17)
        
        
        self.view.addSubview(forgotPasswordButton)
        
        // Sign in Button
        let signInButton = UIButton(type: .custom)
        
        signInButton.setTitle("Sign in", for: .normal)
        signInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        signInButton.backgroundColor = blueColor
        signInButton.layer.cornerRadius = 20
        signInButton.frame = CGRect(x: 130, y: 535, width: 150, height: 40)
        
        self.view.addSubview(signInButton)
        
        // Create a UIView to act as the line separator
        let lineSeparator = UIView(frame: CGRect(x: 118, y: 645, width: 180, height: 1))
        lineSeparator.backgroundColor = borderColor
        
        view.addSubview(lineSeparator)
        
        // "Sign up with Google" button
        let signUpGoogle = createCustomButton(imageName: "google_icon", title: "Sign up with Google", position: CGPoint(x: 67, y: 680))
        
        self.view.addSubview(signUpGoogle)

        // "Sign up with Facebook" button
        let signUpFacebook = createCustomButton(imageName: "facebook_icon", title: "Sign up with Facebook", position: CGPoint(x: 67, y: 730))
        
        self.view.addSubview(signUpFacebook)
        
        // toSignUp button
        let toSignUpButton = UIButton()
        
        toSignUpButton.setTitle("Sign up", for: .normal)
        toSignUpButton.setTitleColor(blueColor, for: .normal)
        
        toSignUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 14.0)
        toSignUpButton.frame = CGRect(x: 108, y: 798, width: 200, height: 40)
        
        
        self.view.addSubview(toSignUpButton)
        
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
    
}
