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
        navigationController?.navigationBar.isHidden = true
        Landing = LandingView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        self.view.addSubview(Landing)
    }
    
    // MARK: Login Button logic
    
        @objc func LoginPressed(sender: UIButton!) {
            navigationController?.pushViewController(LoginViewController(), animated: true)
        }

    
    // MARK: Register Button logic
        
        @objc func RegisterPressed(sender: UIButton!) {
            navigationController?.pushViewController(RegisterViewController(), animated: true)
          }
    
    

}

