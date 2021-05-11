//
//  ViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 13/04/2021.
//

import UIKit

class LandingViewController: UIViewController {

    var Landing: LandingView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        Landing = LandingView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        self.view.addSubview(Landing)
    }
    
    // MARK: Login Button logic
    
        @objc func LoginPressed(sender: UIButton!) {
            self.dismiss(animated: true, completion: nil)
            let LoginController = LoginViewController()
            LoginController.modalPresentationStyle = .fullScreen
            LoginController.view.layoutIfNeeded()
            self.present(LoginController, animated: true)
        }

    
    // MARK: Register Button logic
        
        @objc func RegisterPressed(sender: UIButton!) {
            self.dismiss(animated: true, completion: nil)
            let RegisterViewController = RegisterViewController()
            RegisterViewController.modalPresentationStyle = .fullScreen
            RegisterViewController.view.layoutIfNeeded()
            self.present(RegisterViewController, animated: true)
//            UIView.transition(with: self.view.window!,
//                              duration: 0.5,
//                              options: [.transitionFlipFromLeft],
//                              animations: nil,
//                              completion: nil)
          }
    
    
    @objc func backPressed(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
    }

}

