//
//  CustomCell.swift
//  Nexvent
//
//  Created by Anthony McMillan on 15/04/2021.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    
        self.backgroundColor = .white
        self.layer.shadowOpacity = 0.25
        self.layer.shadowRadius = 6
        self.layer.shadowColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 12
        self.layer.shadowOffset = .zero
        
        
    }
    
    override var frame: CGRect {
            get {
                return super.frame
            }
            set (newFrame) {
                var frame = newFrame
                let newWidth = frame.width * 0.95 // get 80% width here
                let space = (frame.width - newWidth) / 2
                frame.size.width = newWidth
                frame.origin.x += space

                super.frame = frame

            }
        }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
