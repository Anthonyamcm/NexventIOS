//
//  EventsListViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 14/04/2021.
//

import Foundation
import UIKit

class EventsListViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var ListView: EventsListView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
            ListView = EventsListView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
            ListView.EventsList_Table.register(CustomCell.self, forCellReuseIdentifier: "EventsCell")
            ListView.EventsList_Table.separatorStyle = UITableViewCell.SeparatorStyle.none
            ListView.EventsList_Table.tableFooterView = UIView()
            ListView.EventsList_Table.rowHeight = 100
            ListView.EventsList_Table.delegate = self
            ListView.EventsList_Table.dataSource = self
        
        self.view.addSubview(ListView)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {

            return 5
        
        }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let Cell =  ListView.EventsList_Table.dequeueReusableCell(withIdentifier: "EventsCell", for : indexPath) as! CustomCell
                Cell.selectionStyle = .none
                Cell.layoutSubviews()
            return Cell
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
            return 20
        }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
           let headerView = UIView()
           headerView.backgroundColor = UIColor.clear
           return headerView
       }
    
}
