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
    var curvedlineChart: Chart!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        DashBoard = DashBoardView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        view.addSubview(DashBoard)
        
        let chart = BarGraph(frame: CGRect(x: 0, y: 0, width: screenSize().width - 30, height: 200))
        let dataEntries = [
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.2, textValue: "20", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.7, textValue: "70", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.3, textValue: "20", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.55, textValue: "55", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.66, textValue: "66", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.7, textValue: "90", title: "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.23, textValue: "23", title:
                "Test"),
            DataEntry(color: UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1), height: 0.45, textValue: "45", title: "Test")
        ]
        chart.updateDataEntries(dataEntries: dataEntries, animated: true)
        DashBoard.ChartView.addSubview(chart)
    }
    
    
//    @objc func LocationPressed(sender: UIButton!) {
//        self.dismiss(animated: true, completion: nil)
//        let Controller = MapViewController()
//        Controller.modalPresentationStyle = .fullScreen
//        Controller.view.layoutIfNeeded()
//        self.present(Controller, animated: true)
//    }
//
//    @objc func TagPressed(sender: UIButton!) {
//        self.dismiss(animated: true, completion: nil)
//        let Controller = TagsViewController()
//        Controller.modalPresentationStyle = .fullScreen
//        Controller.view.layoutIfNeeded()
//        self.present(Controller, animated: true)
//    }
//
//    @objc func CalenderPressed(sender: UIButton!) {
//        self.dismiss(animated: true, completion: nil)
//        let Controller = CalendarViewController()
//        Controller.modalPresentationStyle = .fullScreen
//        Controller.view.layoutIfNeeded()
//        self.present(Controller, animated: true)
//    }

}
