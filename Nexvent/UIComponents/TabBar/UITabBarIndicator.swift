//
//  UITabBarIndicator.swift
//  Nexvent
//
//  Created by Anthony McMillan on 09/05/2021.
//

import Foundation
import UIKit

open class UITabBarIndicator: UIView {
    override open func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.height / 2
    }
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        self.backgroundColor = tintColor
    }
}
