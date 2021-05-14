//
//  LocationView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 23/04/2021.
//

import Foundation
import UIKit
import MapKit

public class Map: MKMapView {
    
    var Back_Button: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage.init(icon: .fontAwesomeSolid(.times), size: CGSize(width: 42, height: 42), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(TagsViewController(), action: #selector(TagsViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var View: UIView = {
        var view = UIView()
        view.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width , height: 150)
        view.translatesAutoresizingMaskIntoConstraints = true
        view.backgroundColor = .white
        view.layer.masksToBounds = false
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.shadowRadius = 12
        view.layer.shadowOffset = .zero
        view.layer.shadowOpacity = 0.3
        view.layer.cornerRadius = 12
        return view
    }()
    
    var Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Map"
        return Title
    }()
    
    var Search: UITextField  = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.backgroundColor = .white
        TextField.textColor = .lightGray
        TextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.default
        TextField.layer.shadowOpacity = 0.15
        TextField.layer.shadowRadius = 6
        TextField.layer.shadowColor = UIColor.lightGray.cgColor
        TextField.layer.shadowOffset = CGSize(width: 0, height: 0)
        TextField.layer.cornerRadius = 6
        TextField.setLeftPaddingPoints(50)
        TextField.setIcon(UIImage(named: "search")!)
        TextField.font = UIFont(name: "HelveticaNeue-Medium", size: 18)
        return TextField
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
     
        self.addSubview(View)
        
        View.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        View.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        View.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        
        View.addSubview(Back_Button)
        
    
        Back_Button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Back_Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        View.addSubview(Title)
        
        Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        
        View.addSubview(Search)
        
        Search.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        Search.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        Search.bottomAnchor.constraint(equalTo: View.bottomAnchor, constant: 0).isActive = true
        Search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
