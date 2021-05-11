//
//  RegisterViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class RegisterViewController: UIViewController {
    
    var Register: RegisterView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        Register = RegisterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        self.view.addSubview(Register)
        
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if Register.FirstName_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Register.LastName_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Register.Email_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Register.Password_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
            
        }
        
        // Check if the password is secure
        let cleanedPassword = Register.Password_Field.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @objc func RegisterPressed(sender: UIButton!) {
        let error = validateFields()
        
        if error != nil {
            
            // There's something wrong with the fields, show error message
            print(error!)
        }
        else {
            
            // Create cleaned versions of the data
            let firstName = Register.FirstName_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = Register.LastName_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = (Register.Email_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
            let password = (Register.Password_Field.text?.trimmingCharacters(in: .whitespacesAndNewlines))!
            
            // Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                
                // Check for errors
                if err != nil {
                    
                    // There was an error creating the user
                    print("Error creating user")
                }
                else {
                    
                    // User was created successfully, now store the first name and last name
                    let db = Firestore.firestore()
                    
                    db.collection("Users").addDocument(data: ["firstName":firstName!, "lastName":lastName!,"email": email , "uid": result!.user.uid ]) { (error) in
                        
                        if error != nil {
                            // Show error message
                            print("error creating user")
                        }
                    }
                    
                    // Transition to the home screen
                    self.transitionToHome()
                }
                
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
