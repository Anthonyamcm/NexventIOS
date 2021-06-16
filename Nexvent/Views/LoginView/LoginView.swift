//
//  LoginView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import Foundation
import UIKit

class LoginView: UIView {
    var shouldSetupConstraints = true
    
    var backButton: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage.init(icon: .fontAwesomeSolid(.times), size: CGSize(width: 42, height: 42), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(LoginViewController(), action: #selector(LoginViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var loginTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Login"
        return Title
    }()
    
    var emailTextField = CustomTextField(placeholder: "Email")
    
    var passwordTextField: UITextField = {
        var TextField = CustomTextField(placeholder: "Password")
        TextField.isSecureTextEntry = true
        return TextField
    }()
    
    var forgotPasswordButton: UIButton = {
        var Button = UIButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Forgot password?", for: .normal)
        Button.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 16)
        Button.titleLabel?.textAlignment = .center
        return Button
    }()
    
    
    var loginButton: GradientButton = {
        var Button = GradientButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Log In", for: .normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 28)
        Button.titleLabel?.textAlignment = .center
        Button.layer.shadowOpacity = 0.3
        Button.layer.shadowRadius = 12.0
        Button.layer.shadowColor = UIColor.systemBlue.cgColor
        Button.addTarget(LoginViewController(), action: #selector(LoginViewController.loginPressed), for: .touchUpInside)
        return Button
    }()
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        self.addSubview(backButton)
        
        backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        backButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        
        self.addSubview(loginTitle)
        
        loginTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        loginTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        loginTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        
        self.addSubview(emailTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        emailTextField.topAnchor.constraint(equalTo: loginTitle.bottomAnchor, constant: 50).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
    
        self.addSubview(passwordTextField)
        
        passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
        
        self.addSubview(forgotPasswordButton)
        
        forgotPasswordButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 25).isActive = true
        forgotPasswordButton.widthAnchor.constraint(equalTo: self.widthAnchor,  multiplier: 0.85).isActive = true
        forgotPasswordButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(loginButton)
        
        loginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor, constant: 25).isActive = true
        loginButton.widthAnchor.constraint(equalTo: self.widthAnchor,  multiplier: 0.85).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.layoutIfNeeded()
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override func updateConstraints() {
        if(shouldSetupConstraints) {
            // AutoLayout constraints
            shouldSetupConstraints = false
        }
        super.updateConstraints()
    }
    
}
