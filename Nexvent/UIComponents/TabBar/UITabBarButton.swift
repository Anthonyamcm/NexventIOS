//
//  UITabBarButton.swift
//  Nexvent
//
//  Created by Anthony McMillan on 09/05/2021.
//

import Foundation
import UIKit


public class UITabBarButton: UIButton {
    
    var selectedColor: UIColor! = UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1) {
        didSet {
            reloadApperance()
        }
    }
    
    var unselectedColor: UIColor! = UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1) {
        didSet {
            reloadApperance()
        }
    }
    
    init(forItem item: UITabBarItem) {
        super.init(frame: .zero)
        setImage(item.image, for: .normal)
    }
    
    init(image: UIImage){
        super.init(frame: .zero)
        setImage(image, for: .normal)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    
    override public var isSelected: Bool {
        didSet {
            reloadApperance()
        }
    }
    
    func reloadApperance(){
        self.tintColor = isSelected ? selectedColor : unselectedColor
    }
}
