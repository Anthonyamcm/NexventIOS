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
    
    private var viewModel = registerViewModel()


    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        Register = RegisterView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        self.view.addSubview(Register)
        configureTextFieldObservers()
        
    }
    
    func validateFields() -> String? {
        
        // Check that all fields are filled in
        if Register.fullNameTextField.text == "" ||
            Register.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
            Register.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" {
            
            return "Please fill in all fields."
            
        }
        
        // Check if the password is secure
        let cleanedPassword = Register.passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if Utilities.isPasswordValid(cleanedPassword) == false {
            // Password isn't secure enough
            return "Please make sure your password is at least 8 characters, contains a special character and a number."
        }
        
        return nil
    }
    
    @objc func RegisterPressed(sender: UIButton!) {
            guard let fullName = Register.fullNameTextField.text  else {return}
            guard let email = Register.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
            guard let password = Register.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        
            let credentials = AuthCredentials(email: email, password: password, fullName: fullName)
        
        AuthService.registerUser(withCredientials: credentials) { error in
            if let error = error {
                print("DEBUG: Error signing user up \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    
    func configureTextFieldObservers() {
        Register.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        Register.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        Register.fullNameTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == Register.emailTextField {
            viewModel.email = sender.text
        } else if sender == Register.passwordTextField {
            viewModel.password = sender.text
        } else {
            viewModel.fullName = sender.text
        }
    }
    
    func checkFormStatus() {
        if viewModel.isFormValid{
            Register.registerButton.isEnabled = true
        } else {
            Register.registerButton.isEnabled = false
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
        navigationController?.popViewController(animated: true)
    }
    
}
