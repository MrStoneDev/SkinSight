//
//  SignUpViewController.swift
//  Skinsight
//
//  Created by Mario Alvarado on 18/07/23.
//

import UIKit

class SignUpViewController: UIViewController {
    
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

        // E-mail Text Field
        let emailTextField = createTextField(frame: CGRect(x: 67, y: 370, width: 280, height: 55), placeholder: "E-mail")
        
        let emailLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        emailTextField.leftView = emailLeftPaddingView
        emailTextField.leftViewMode = .always
        
        view.addSubview(emailTextField)

        // Password Text Field
        let passwordTextField = createTextField(frame: CGRect(x: 67, y: 447, width: 280, height: 55), placeholder: "Password")
        
        let passwordLeftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 16, height: 55))
        passwordTextField.leftView = passwordLeftPaddingView
        passwordTextField.leftViewMode = .always
        
        view.addSubview(passwordTextField)
        
        // Sign up Button
        let signUpButton = UIButton(type: .custom)
        
        signUpButton.setTitle("Sign up", for: .normal)
        signUpButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 18.0)
        
        signUpButton.backgroundColor = blueColor
        signUpButton.layer.cornerRadius = 20
        signUpButton.frame = CGRect(x: 130, y: 535, width: 150, height: 40)
        
        self.view.addSubview(signUpButton)
        
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
        
        // Account label
        let accountLabel = UILabel()
        
        accountLabel.text = "Already have an\naccount?"
        accountLabel.numberOfLines = 2
        
        accountLabel.font = UIFont(name: "Lato-Regular", size: 14.0)
        accountLabel.frame = CGRect(x: 159, y: 790, width: 200, height: 40)
       
        self.view.addSubview(accountLabel)
        
        // toSignIn button
        let toSignInButton = UIButton()
        
        toSignInButton.setTitle("Sign in", for: .normal)
        toSignInButton.setTitleColor(blueColor, for: .normal)
        
        toSignInButton.titleLabel?.font = UIFont(name: "Lato-Regular", size: 14.0)
        toSignInButton.frame = CGRect(x: 137, y: 798, width: 200, height: 40)
        
        
        self.view.addSubview(toSignInButton)
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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
