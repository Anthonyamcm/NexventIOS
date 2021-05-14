//
//  TagsViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 23/04/2021.
//

import Foundation
import UIKit
import TTGTagCollectionView

class TagsViewController: UIViewController, TTGTextTagCollectionViewDelegate{
    
    var TagsView: TagView!
    
    let strings = ["AutoLayout", "dynamically", "calculates", "the", "size", "and", "position",
                           "of", "all", "the", "views", "in", "your", "view", "hierarchy", "based",
                           "on", "constraints", "placed", "on", "those", "views"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        TagsView = TagView(frame: CGRect(x: 0, y: 0, width: screenSize().width, height: screenSize().height))
        view.addSubview(TagsView)
    
        
        TagsView.collectionView.delegate = self
        TagsView.collectionView.alignment = .left
        

        for text in strings {
                    let content = TTGTextTagStringContent.init(text: text)
                    content.textColor = UIColor.white
                    content.textFont = UIFont(name: "GTEestiDisplay-Medium", size: 22)!
                    
                    let normalStyle = TTGTextTagStyle.init()
                    normalStyle.backgroundColor = UIColor.lightGray
                    normalStyle.borderWidth = .zero
                    normalStyle.extraSpace = CGSize.init(width: 20, height: 8)
                    
                    let selectedStyle = TTGTextTagStyle.init()
                    selectedStyle.borderWidth = .zero
                    selectedStyle.enableGradientBackground = true
                    selectedStyle.gradientBackgroundStartColor = UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1)
                    selectedStyle.gradientBackgroundStartPoint = CGPoint(x: 0, y: 0)
                    selectedStyle.gradientBackgroundEndColor = UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1)
                    selectedStyle.gradientBackgroundEndPoint = CGPoint(x: 1, y: 1)
                    selectedStyle.shadowColor = UIColor.systemBlue
                    selectedStyle.extraSpace = CGSize.init(width: 20, height: 8)
                    
                    let tag = TTGTextTag.init()
                    tag.content = content
                    tag.style = normalStyle
                    tag.selectedStyle = selectedStyle
                    
                    TagsView.collectionView.addTag(tag)
                }
        
        TagsView.collectionView.reload()
    }
    
    @objc func backPressed(sender: UIButton!){
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}


