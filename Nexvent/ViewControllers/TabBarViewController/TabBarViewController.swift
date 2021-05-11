//
//  TabBarViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/04/2021.
//

import Foundation
import UIKit

class TabBarViewController: TabBarController {

    
    override func viewDidLoad() {

        
        let CardStackVC = CardStackViewController()
        let EventsListVC = EventsListViewController()
        let ProfileVC = DashboardViewController()
        
        CardStackVC.tabBarItem = UITabBarItem(title: "Home", image: UIImage(named: "icon"), tag: 1)
        EventsListVC.tabBarItem = UITabBarItem(title: "Events", image: UIImage(named: "icon"), tag: 2)
        ProfileVC.tabBarItem = UITabBarItem(title: "Dashboard", image: UIImage(named: "icon"), tag: 3)
        
        self.viewControllers = [ProfileVC, CardStackVC, EventsListVC]
        
        super.viewDidLoad()
        
    }
}
