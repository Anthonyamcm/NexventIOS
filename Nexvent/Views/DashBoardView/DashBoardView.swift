//
//  DashBoardView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 21/04/2021.
//

import Foundation
import UIKit

class DashBoardView: UIView {

    
    
    var DashBoardTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Dashboard"
        return Title
    }()
    
    var DashBoardSubTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = .lightGray
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Anthony McMillan"
        return Title
    }()
    
    var Settings: UIButton = {
        var button  = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 24
        button.backgroundColor = .clear
        button.setImage(UIImage(named: "slider"), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
        button.layer.zPosition = 1;
        return button
    }()
    
    var CalendarView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 12
        return view
    }()
    
    var CalendarTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Calendar"
        return Title
    }()
    
    var TagsView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 12
        return view
    }()
    
    var TagsTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Tags"
        return Title
    }()
    
    var LocationView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 12
        return view
    }()
    
    var LocationTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Location"
        return Title
    }()
    
    var ChartView: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.25
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 12
        return view
    }()
    
    var ChartTitle: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        Title.text = "Active Events"
        return Title
    }()
    

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(DashBoardTitle)
        
        DashBoardTitle.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        DashBoardTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(DashBoardSubTitle)
        
        DashBoardSubTitle.topAnchor.constraint(equalTo: DashBoardTitle.bottomAnchor, constant: 0).isActive = true
        DashBoardSubTitle.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(Settings)
        
        Settings.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        Settings.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -45).isActive = true
        
        self.addSubview(ChartView)
        
        ChartView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        ChartView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        ChartView.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor,constant: 20).isActive = true
        ChartView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        ChartView.addSubview(ChartTitle)
        
        ChartTitle.topAnchor.constraint(equalTo: ChartView.topAnchor, constant: 10).isActive = true
        ChartTitle.leftAnchor.constraint(equalTo: ChartView.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(CalendarView)
        
        CalendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        CalendarView.topAnchor.constraint(equalTo: ChartView.bottomAnchor, constant: 20).isActive = true
        CalendarView.heightAnchor.constraint(equalToConstant: 250).isActive = true
        CalendarView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        CalendarView.addSubview(CalendarTitle)
        
        CalendarTitle.topAnchor.constraint(equalTo: CalendarView.topAnchor, constant: 10).isActive = true
        CalendarTitle.leftAnchor.constraint(equalTo: CalendarView.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(TagsView)
        
        TagsView.leadingAnchor.constraint(equalTo: CalendarView.trailingAnchor, constant: 30).isActive = true
        TagsView.topAnchor.constraint(equalTo: ChartView.bottomAnchor, constant: 20).isActive = true
        TagsView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110).isActive = true
        TagsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        TagsView.addSubview(TagsTitle)
        
        TagsTitle.topAnchor.constraint(equalTo: TagsView.topAnchor, constant: 10).isActive = true
        TagsTitle.leftAnchor.constraint(equalTo: TagsView.leftAnchor, constant: 10).isActive = true
        
        self.addSubview(LocationView)
        
        LocationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        LocationView.topAnchor.constraint(equalTo: CalendarView.bottomAnchor, constant: 30).isActive = true
        LocationView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110).isActive = true
        LocationView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        LocationView.addSubview(LocationTitle)
        
        LocationTitle.topAnchor.constraint(equalTo: LocationView.topAnchor, constant: 10).isActive = true
        LocationTitle.leftAnchor.constraint(equalTo: LocationView.leftAnchor, constant: 10).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
