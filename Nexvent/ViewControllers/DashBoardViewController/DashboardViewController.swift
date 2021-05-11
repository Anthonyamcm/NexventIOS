//
//  ProfileViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 20/04/2021.
//

import Foundation
import UIKit
import HorizonCalendar


class DashboardViewController: UIViewController{

    var DashBoard: DashBoardView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        DashBoard = DashBoardView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        view.addSubview(DashBoard)
        


        
    }
    
    
    @objc func LocationPressed(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
        let Controller = MapViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true)
    }
    
    @objc func TagPressed(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
        let Controller = TagsViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true)
    }
    
    @objc func CalenderPressed(sender: UIButton!) {
        self.dismiss(animated: true, completion: nil)
        let Controller = CalendarViewController()
        Controller.modalPresentationStyle = .fullScreen
        Controller.view.layoutIfNeeded()
        self.present(Controller, animated: true)
    }

}
