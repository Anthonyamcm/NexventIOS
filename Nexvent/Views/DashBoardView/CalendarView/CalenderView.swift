//
//  CalenderView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 01/05/2021.
//

import Foundation
import UIKit
import HorizonCalendar

class calView: UIView {
    
    var Back_Button: UIButton = {
        var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage.init(icon: .fontAwesomeSolid(.times), size: CGSize(width: 42, height: 42), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
        Button.addTarget(CalendarViewController(), action: #selector(CalendarViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Calendar"
        return Title
    }()
    
    var View: UIView = {
        var view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.masksToBounds = false
        view.backgroundColor = .white
        view.layer.shadowOpacity = 0.15
        view.layer.shadowRadius = 6
        view.layer.shadowColor = UIColor.lightGray.cgColor
        view.layer.shadowOffset = CGSize(width: 0, height: 0)
        view.layer.cornerRadius = 6
        view.layer.zPosition = 10
        return view
    }()
    
    var Savebutton: GradientButton = {
        var Button = GradientButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Save", for: .normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 26)
        Button.titleLabel?.textAlignment = .center
        Button.layer.shadowOpacity = 0.3
        Button.layer.shadowRadius = 12.0
        Button.layer.shadowColor = UIColor.systemBlue.cgColor
        return Button
    }()
    
    var CancelButton: UIButton = {
        var Button = UIButton()
        Button.translatesAutoresizingMaskIntoConstraints = false
        Button.setTitle("Cancel", for: .normal)
        Button.setTitleColor(UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0), for: UIControl.State.normal)
        Button.titleLabel?.font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        Button.titleLabel?.textAlignment = .center
        Button.addTarget(LandingViewController(), action: #selector(LandingViewController.RegisterPressed), for: .touchUpInside)
        return Button
    }()
    
    override init(frame: CGRect){
    super.init(frame: frame)
        
        self.addSubview(Back_Button)
        
    
        Back_Button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Back_Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(Title)
        
        Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(View)
        
        View.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        View.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        View.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        View.heightAnchor.constraint(equalToConstant: 110).isActive = true
        
        View.addSubview(Savebutton)
        
        Savebutton.trailingAnchor.constraint(equalTo: View.trailingAnchor, constant: -30).isActive = true
        Savebutton.centerYAnchor.constraint(equalTo: View.centerYAnchor).isActive = true
        Savebutton.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        View.addSubview(CancelButton)
        
        CancelButton.leadingAnchor.constraint(equalTo: View.leadingAnchor, constant: 30).isActive = true
        CancelButton.centerYAnchor.constraint(equalTo: View.centerYAnchor).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
