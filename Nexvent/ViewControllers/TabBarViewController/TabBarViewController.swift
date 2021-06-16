//
//  TabBarViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/04/2021.
//

import Foundation
import UIKit
import SwiftIcons
import Firebase

class TabBarViewController: TabBarController {

    
    override func viewDidLoad() {

        
        let CardStackVC = CardStackViewController()
        let EventsListVC = EventsListViewController()
        let ProfileVC = DashboardViewController()
        
        CardStackVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage.init(icon: .fontAwesomeSolid(.ellipsisH), size: CGSize(width: 32, height: 32), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), tag: 1)
        EventsListVC.tabBarItem = UITabBarItem(title: "Events", image: UIImage.init(icon: .fontAwesomeSolid(.alignJustify), size: CGSize(width: 32, height: 32), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), tag: 2)
        ProfileVC.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage.init(icon: .fontAwesomeSolid(.home), size: CGSize(width: 32, height: 32), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), tag: 3)
        
        self.viewControllers = [ProfileVC, CardStackVC, EventsListVC]
        
        super.viewDidLoad()
        
        checkIfUserIsLoggedIn()
//        logout()
        
    }
    

    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser == nil{
            presentandingController()
        }else{
            print("User loged in")
        }
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
        } catch {
            
        }
    }
    
    func presentandingController(){
        DispatchQueue.main.async {
            let controller = LandingViewController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
        }
    }
}
