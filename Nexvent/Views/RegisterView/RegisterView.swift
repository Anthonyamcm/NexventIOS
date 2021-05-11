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
    
    var Back_Button: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage(named: "cross"), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(RegisterViewController(), action: #selector(RegisterViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var Register_Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Sign up"
        return Title
    }()
    
    var FirstName_Field: UITextField = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.adjustsFontSizeToFitWidth = true
        TextField.layer.masksToBounds = false
        TextField.backgroundColor = .white
        TextField.textColor = .black
        TextField.attributedPlaceholder = NSAttributedString(string: "First Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.default
        TextField.layer.shadowOpacity = 0.15
        TextField.layer.shadowRadius = 6
        TextField.layer.shadowColor = UIColor.lightGray.cgColor
        TextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        TextField.layer.cornerRadius = 6
        TextField.setLeftPaddingPoints(15)
        TextField.font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        return TextField
    }()
    
    var LastName_Field: UITextField = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.adjustsFontSizeToFitWidth = true
        TextField.layer.masksToBounds = false
        TextField.backgroundColor = .white
        TextField.textColor = .black
        TextField.attributedPlaceholder = NSAttributedString(string: "Last Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.default
        TextField.layer.shadowOpacity = 0.15
        TextField.layer.shadowRadius = 6
        TextField.layer.shadowColor = UIColor.lightGray.cgColor
        TextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        TextField.layer.cornerRadius = 6
        TextField.setLeftPaddingPoints(15)
        TextField.font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        return TextField
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
    
    var Terms_Label: UILabel = {
        var TermsAndConditions = UILabel()
        TermsAndConditions.translatesAutoresizingMaskIntoConstraints = false
        TermsAndConditions.textColor = .lightGray
        TermsAndConditions.textAlignment = .center
        TermsAndConditions.font = UIFont(name: "GTEestiDisplay-Medium", size: 20)
        TermsAndConditions.text = "By signing up you agree to our Terms of Use and Privacy Policy"
        TermsAndConditions.numberOfLines = 2
        return TermsAndConditions
    }()
    
    var register_button: GradientButton = {
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
    


    override init(frame: CGRect) {
        super.init(frame: frame)
        
        
        
        self.addSubview(Back_Button)
        
    
        Back_Button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        Back_Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(Register_Title)
        
        Register_Title.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        Register_Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 25).isActive = true
        Register_Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        
        
        self.addSubview(FirstName_Field)
        
        FirstName_Field.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        FirstName_Field.topAnchor.constraint(equalTo: Register_Title.bottomAnchor, constant: 50).isActive = true
        FirstName_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        FirstName_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(LastName_Field)
        
        LastName_Field.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        LastName_Field.topAnchor.constraint(equalTo: Register_Title.bottomAnchor, constant: 50).isActive = true
        LastName_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.4).isActive = true
        LastName_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(Email_Field)
        
        Email_Field.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        Email_Field.topAnchor.constraint(equalTo: FirstName_Field.bottomAnchor, constant: 25).isActive = true
        Email_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        Email_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        self.addSubview(Password_Field)
        
        Password_Field.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 30).isActive = true
        Password_Field.topAnchor.constraint(equalTo: Email_Field.bottomAnchor, constant: 25).isActive = true
        Password_Field.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.85).isActive = true
        Password_Field.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(Terms_Label)
        
        Terms_Label.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 0.7).isActive = true
        Terms_Label.topAnchor.constraint(equalTo: Password_Field.bottomAnchor, constant: 50).isActive = true
        Terms_Label.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        
        self.addSubview(register_button)
        
        register_button.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        register_button.topAnchor.constraint(equalTo: Terms_Label.bottomAnchor, constant: 50).isActive = true
        register_button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -150).isActive = true
        register_button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
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
