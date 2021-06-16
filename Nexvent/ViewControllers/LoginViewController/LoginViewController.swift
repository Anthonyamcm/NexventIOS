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
    
    private var viewModel = loginViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        Login = LoginView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: UIScreen.main.bounds.height))
        self.view.addSubview(Login)
        configureTextFieldObservers()
        
    }
    
    @objc func loginPressed(sender: UIButton!){
        guard let email = Login.emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
        guard let password = Login.passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) else {return}
            
        AuthService.logUserIn(withEmail: email, password: password) { result, error in
            if let error = error {
                print("DEBUG: Error signing user in \(error.localizedDescription)")
                return
            }
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func configureTextFieldObservers() {
        Login.emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        Login.passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    @objc func textDidChange(sender: UITextField) {
        if sender == Login.emailTextField {
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        checkFormStatus()
        
        print("DEBUG: Form is Valid \(viewModel.isFormValid)")
    }
    
    func checkFormStatus() {
        if viewModel.isFormValid{
            Login.loginButton.isEnabled = true
        } else {
            Login.loginButton.isEnabled = false
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
