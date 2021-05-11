//
//  LandingView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import Foundation
import UIKit



class LandingView: UIView {
    var shouldSetupConstraints = true
    
   
    var LogoImage: UIImageView = {
        var ImageView = UIImageView(image: UIImage(named: "logo"))
        ImageView.translatesAutoresizingMaskIntoConstraints = false
        return ImageView
    }()
    
    
    var LoginButton: GradientButton = {
        var Button = GradientButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Log In", for: .normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 28)
        Button.titleLabel?.textAlignment = .center
        Button.layer.shadowOpacity = 0.3
        Button.layer.shadowRadius = 12.0
        Button.layer.shadowColor = UIColor.systemBlue.cgColor
        Button.layer.cornerRadius = 12
        Button.layer.zPosition = 1
        Button.addTarget(LandingViewController(), action: #selector(LandingViewController.LoginPressed), for: .touchUpInside)
        return Button
    }()
    
    var RegisterButton: UIButton = {
        var Button = UIButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Register", for: .normal)
        Button.setTitleColor(UIColor.lightGray, for: UIControl.State.normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 28)
        Button.titleLabel?.textAlignment = .center
        Button.addTarget(LandingViewController(), action: #selector(LandingViewController.RegisterPressed), for: .touchUpInside)
        return Button
    }()
    


    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
       
        self.addSubview(LogoImage)
        LogoImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        LogoImage.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -40).isActive = true
        
        
        
        self.addSubview(LoginButton)
        LoginButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        LoginButton.heightAnchor.constraint(equalToConstant: 55).isActive = true
        LoginButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        LoginButton.topAnchor.constraint(equalTo: LogoImage.bottomAnchor, constant: 100).isActive = true
        
        
        self.addSubview(RegisterButton)
        RegisterButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        RegisterButton.widthAnchor.constraint(equalToConstant: 250).isActive = true
        RegisterButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        RegisterButton.topAnchor.constraint(equalTo: LoginButton.bottomAnchor, constant: 30).isActive = true
        
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

public class GradientButton: UIButton  {

    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutGradientLabelLayer()
    }

    // MARK: Private
    private func layoutGradientLabelLayer() {
       let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1).cgColor , UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = 12
        self.layer.insertSublayer(gradient, at: 0)
    }
}
