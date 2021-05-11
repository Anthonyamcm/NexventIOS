//
//  EventsListView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 14/04/2021.
//

import Foundation
import UIKit

class EventsListView: UIView {
    
    
    var EventsList_Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Events"
        return Title
    }()
    
    var EventsList_SubTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = .lightGray
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Manage your events"
        return Title
    }()
    
    var EventsList_Table: UITableView = {
        var Table = UITableView()
        Table.translatesAutoresizingMaskIntoConstraints = false
        Table.backgroundColor = .white
        return Table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(EventsList_Title)
        
        EventsList_Title.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        EventsList_Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        EventsList_Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(EventsList_SubTitle)
        
        EventsList_SubTitle.widthAnchor.constraint(equalTo: self.widthAnchor).isActive = true
        EventsList_SubTitle.topAnchor.constraint(equalTo: EventsList_Title.bottomAnchor, constant: 0).isActive = true
        EventsList_SubTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(EventsList_Table)
        
        EventsList_Table.topAnchor.constraint(equalTo: EventsList_Title.bottomAnchor, constant: 25).isActive = true
        EventsList_Table.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        EventsList_Table.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        EventsList_Table.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
