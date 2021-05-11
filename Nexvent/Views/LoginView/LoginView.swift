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
    
    var Back_Button: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage(named: "cross"), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(LoginViewController(), action: #selector(LoginViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var Login_Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Login"
        return Title
    }()
    
    var Email_Field: UITextField = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.adjustsFontSizeToFitWidth = true
        TextField.layer.masksToBounds = false
        TextField.backgroundColor = .white
        TextField.textColor = .black
        TextField.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.emailAddress
        TextField.layer.shadowOpacity = 0.15
        TextField.layer.shadowRadius = 6
        TextField.layer.shadowColor = UIColor.lightGray.cgColor
        TextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        TextField.layer.cornerRadius = 6
        TextField.setLeftPaddingPoints(15)
        TextField.font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        return TextField
    }()
    
    
    var Password_Field: UITextField = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.adjustsFontSizeToFitWidth = true
        TextField.layer.masksToBounds = false
        TextField.backgroundColor = .white
        TextField.textColor = .black
        TextField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.default
        TextField.isSecureTextEntry = true
        TextField.layer.shadowOpacity = 0.15
        TextField.layer.shadowRadius = 6
        TextField.layer.shadowColor = UIColor.lightGray.cgColor
        TextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        TextField.layer.cornerRadius = 6
        TextField.setLeftPaddingPoints(15)
        TextField.font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        return TextField
    }()
    
    var ForgotPassword_Button: UIButton = {
        var Button = UIButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Forgot password?", for: .normal)
        Button.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 16)
        Button.titleLabel?.textAlignment = .center
        return Button
    }()
    
    
    var Login_Button: GradientButton = {
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
        
        
        self.addSubview(Back_Button)
        
    
        Back_Button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        Back_Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        
        self.addSubview(Login_Title)
        
        Login_Title.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Login_Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        Login_Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        
        self.addSubview(Email_Field)
        
        Email_Field.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        Email_Field.topAnchor.constraint(equalTo: Login_Title.bottomAnchor, constant: 50).isActive = true
        Email_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        Email_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    
        self.addSubview(Password_Field)
        
        Password_Field.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        Password_Field.topAnchor.constraint(equalTo: Email_Field.bottomAnchor, constant: 25).isActive = true
        Password_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        Password_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(ForgotPassword_Button)
        
        ForgotPassword_Button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        ForgotPassword_Button.topAnchor.constraint(equalTo: Password_Field.bottomAnchor, constant: 25).isActive = true
        ForgotPassword_Button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -150).isActive = true
        ForgotPassword_Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(Login_Button)
        
        Login_Button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        Login_Button.topAnchor.constraint(equalTo: ForgotPassword_Button.bottomAnchor, constant: 25).isActive = true
        Login_Button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -150).isActive = true
        Login_Button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
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
