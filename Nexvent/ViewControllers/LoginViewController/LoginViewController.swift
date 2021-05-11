//
//  LoginViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    
    var Login: LoginView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        Login = LoginView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        self.view.addSubview(Login)
        
    }
    
    @objc func loginPressed(sender: UIButton!){
        // Create cleaned versions of the text field
        let email = Login.Email_Field.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = Login.Password_Field.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            
            if error != nil {
                // Couldn't sign in
                print(error)
            }
            else {
                
                self.transitionToHome()
                
            }
        }
    }
        
    func transitionToHome() {
        
        let homeViewController = TabBarViewController()
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.view.endEditing(true)
    }
    
    @objc func backPressed(sender: UIButton!) {
        let landingViewController = LandingViewController()
        self.view.window?.rootViewController = landingViewController
        self.view.window?.makeKeyAndVisible()
    }
    
}
