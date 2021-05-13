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
    
    var View: UIView = {
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
    
//    var LocationButton: GradientButton = {
//        var Button  = GradientButton()
//        Button.translatesAutoresizingMaskIntoConstraints = false
//        Button.layer.shadowOpacity = 0.3
//        Button.layer.shadowRadius = 12.0
//        Button.layer.shadowColor = UIColor.systemBlue.cgColor
//        Button.layer.cornerRadius = 12
//        Button.setImage(UIImage(named: "map-marked"), for: .normal)
//        Button.setImage(UIImage(named: "map-marked"), for: .highlighted)
//        Button.imageView?.contentMode = .scaleAspectFit
//        Button.layer.zPosition = 1
//        Button.layer.shadowOffset = CGSize(width: 0, height: 0)
//        Button.addTarget(DashboardViewController(), action: #selector(DashboardViewController.LocationPressed), for: .touchUpInside)
//        return Button
//    }()
//
//    var TagsButton: GradientButton = {
//        var Button  = GradientButton()
//        Button.translatesAutoresizingMaskIntoConstraints = false
//        Button.layer.shadowOpacity = 0.3
//        Button.layer.shadowRadius = 12.0
//        Button.layer.shadowColor = UIColor.systemBlue.cgColor
//        Button.layer.cornerRadius = 12
//        Button.setImage(UIImage(named: "tags"), for: .normal)
//        Button.setImage(UIImage(named: "tags"), for: .highlighted)
//        Button.imageView?.contentMode = .scaleAspectFit
//        Button.layer.zPosition = 1
//        Button.layer.shadowOffset = CGSize(width: 0, height: 0)
//        Button.addTarget(DashboardViewController(), action: #selector(DashboardViewController.TagPressed), for: .touchUpInside)
//        return Button
//    }()
//
//    var DateButton: GradientButton = {
//        var Button  = GradientButton()
//        Button.translatesAutoresizingMaskIntoConstraints = false
//        Button.layer.shadowOpacity = 0.3
//        Button.layer.shadowRadius = 12.0
//        Button.layer.shadowColor = UIColor.systemBlue.cgColor
//        Button.layer.cornerRadius = 12
//        Button.setImage(UIImage(named: "calendar"), for: .normal)
//        Button.setImage(UIImage(named: "calendar"), for: .highlighted)
//        Button.imageView?.contentMode = .scaleAspectFit
//        Button.layer.zPosition = 1
//        Button.layer.shadowOffset = CGSize(width: 0, height: 0)
//        Button.addTarget(DashboardViewController(), action: #selector(DashboardViewController.CalenderPressed), for: .touchUpInside)
//        return Button
//    }()
    
    
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
        
        self.addSubview(CalendarView)
        
        CalendarView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        CalendarView.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor, constant: 20).isActive = true
        CalendarView.heightAnchor.constraint(equalToConstant: 300).isActive = true
        CalendarView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        self.addSubview(TagsView)
        
        TagsView.leadingAnchor.constraint(equalTo: CalendarView.trailingAnchor, constant: 30).isActive = true
        TagsView.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor, constant: 20).isActive = true
        TagsView.heightAnchor.constraint(equalToConstant: 500).isActive = true
        TagsView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        
        self.addSubview(LocationView)
        
        LocationView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        LocationView.topAnchor.constraint(equalTo: CalendarView.bottomAnchor, constant: 30).isActive = true
        LocationView.heightAnchor.constraint(equalToConstant: 170).isActive = true
        LocationView.widthAnchor.constraint(equalToConstant: 170).isActive = true
        
        self.addSubview(View)
        
        View.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        View.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        View.topAnchor.constraint(equalTo: LocationView.bottomAnchor,constant: 30).isActive = true
        View.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -110).isActive = true
        
        
//        self.addSubview(LocationButton)
//
//        LocationButton.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor, constant: 20).isActive = true
//        LocationButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
//        LocationButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        LocationButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
//
//        self.addSubview(TagsButton)
//
//        TagsButton.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor, constant: 20).isActive = true
//        TagsButton.leadingAnchor.constraint(equalTo: LocationButton.trailingAnchor, constant: 33).isActive = true
//        TagsButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        TagsButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
//
//        self.addSubview(DateButton)
//
//        DateButton.topAnchor.constraint(equalTo: DashBoardSubTitle.bottomAnchor, constant: 20).isActive = true
//        DateButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
//        DateButton.heightAnchor.constraint(equalToConstant: 75).isActive = true
//        DateButton.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.25).isActive = true
//

            
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
