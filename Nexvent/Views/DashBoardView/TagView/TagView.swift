//
//  TagView.swift
//  Nexvent
//
//  Created by Anthony McMillan on 29/04/2021.
//

import Foundation
import UIKit
import TTGTagCollectionView

class TagView: UIView {
    
    var Back_Button: UIButton = {
            var Button = UIButton()
            Button.translatesAutoresizingMaskIntoConstraints = false
            Button.setImage(UIImage.init(icon: .fontAwesomeSolid(.times), size: CGSize(width: 42, height: 42), textColor: UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)), for: .normal)
            Button.layer.cornerRadius = 0.5 * 30
            Button.addTarget(TagsViewController(), action: #selector(TagsViewController.backPressed), for: .touchUpInside)
            return Button
        }()
    
    var Title: UILabel = {
        var Title = UILabel()
        Title.translatesAutoresizingMaskIntoConstraints = false
        Title.textColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        Title.textAlignment = .left
        Title.font = UIFont(name: "GTEestiDisplay-Medium", size: 36)
        Title.text = "Tags"
        return Title
    }()
    
    var Search: UITextField  = {
        var TextField = UITextField()
        TextField.translatesAutoresizingMaskIntoConstraints = false
        TextField.backgroundColor = UIColor.lightGray.withAlphaComponent(0.15)
        TextField.textColor = .lightGray
        TextField.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        TextField.keyboardType = UIKeyboardType.default
        TextField.layer.cornerRadius = 24
        TextField.setLeftPaddingPoints(25)
        TextField.font = UIFont(name: "GTEestiDisplay-Medium", size: 18)
        return TextField
    }()
    
    var collectionView: TTGTextTagCollectionView = {
        var collection = TTGTextTagCollectionView()
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
   
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.addSubview(Back_Button)
        
    
        Back_Button.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Back_Button.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -30).isActive = true
        
        self.addSubview(Title)
        
        Title.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        Title.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15).isActive = true
        
        self.addSubview(Search)
        
        Search.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        Search.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        Search.topAnchor.constraint(equalTo: Title.bottomAnchor, constant: 15).isActive = true
        Search.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        self.addSubview(collectionView)

        collectionView.topAnchor.constraint(equalTo: Search.bottomAnchor, constant: 20).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15).isActive = true
        collectionView.heightAnchor.constraint(equalTo: self.heightAnchor, constant: -100).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
}
