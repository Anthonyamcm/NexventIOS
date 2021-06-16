//
//  RegisterView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import Foundation
import UIKit



class RegisterView: UIView {
    var shouldSetupConstraints = true
    
    var backButton: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage.init(icon: .fontAwesomeSolid(.times), size: CGSize(width: 42, height: 42), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(RegisterViewController(), action: #selector(RegisterViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var registerTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Sign up"
        return Title
    }()
    
    var termsLabel: UILabel = {
        var TermsAndConditions = UILabel()
        TermsAndConditions.translatesAutoresizingMaskIntoConstraints = false
        TermsAndConditions.textColor = .lightGray
        TermsAndConditions.textAlignment = .center
        TermsAndConditions.font = UIFont(name: "GTEestiDisplay-Medium", size: 20)
        TermsAndConditions.text = "By signing up you agree to our Terms of Use and Privacy Policy"
        TermsAndConditions.numberOfLines = 2
        return TermsAndConditions
    }()
    
    var registerButton: GradientButton = {
        var Button = GradientButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Sign up", for: .normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 28)
        Button.titleLabel?.textAlignment = .center
        Button.layer.shadowOpacity = 0.3
        Button.layer.shadowRadius = 12.0
        Button.layer.shadowColor = UIColor.systemBlue.cgColor
        Button.addTarget(RegisterViewController(), action: #selector(RegisterViewController.RegisterPressed), for: .touchUpInside)
        return Button
    }()
    
    var passwordTextField: UITextField = {
        var TextField = CustomTextField(placeholder: "Password")
        TextField.isSecureTextEntry = true
        return TextField
    }()
    
    var fullNameTextField = CustomTextField(placeholder: "Full Name")
    
    var emailTextField = CustomTextField(placeholder: "Email")
    
 
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        self.addSubview(backButton)
        
    
        backButton.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        backButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(registerTitle)
        
        registerTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        registerTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        registerTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        
        self.addSubview(fullNameTextField)
        
        fullNameTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        fullNameTextField.topAnchor.constraint(equalTo: registerTitle.bottomAnchor, constant: 50).isActive = true
        fullNameTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
        self.addSubview(emailTextField)
        
        emailTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        emailTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 25).isActive = true
        emailTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
        
        self.addSubview(passwordTextField)
        
        passwordTextField.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 25).isActive = true
        passwordTextField.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        
        self.addSubview(termsLabel)
        
        termsLabel.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        termsLabel.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 50).isActive = true
        termsLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(registerButton)
        
        registerButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        registerButton.topAnchor.constraint(equalTo: termsLabel.bottomAnchor, constant: 50).isActive = true
        registerButton.widthAnchor.constraint(equalTo: self.widthAnchor,  multiplier: 0.85).isActive = true
        registerButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
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
