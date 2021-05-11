//
//  extentions.swift
//  Nexvent
//
//  Created by Anthony McMillan on 10/11/2019.
//  Copyright © 2019 Anthony McMillan. All rights reserved.
//

import Foundation
import UIKit


// MARK: UITEXTFIELD Extenstion


extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    
    func setIcon(_ image: UIImage) {
       let iconView = UIImageView(frame:
                      CGRect(x: 10, y: 5, width: 20, height: 20))
       iconView.image = image
       let iconContainerView: UIView = UIView(frame:
                      CGRect(x: 20, y: 0, width: 30, height: 30))
       iconContainerView.addSubview(iconView)
       leftView = iconContainerView
       leftViewMode = .always
    }
    
}


// MARK: UIBUTTON Extenstion

extension UIButton {
  
open override var isEnabled: Bool{
    didSet {
        alpha = isEnabled ? 1.0 : 0.5
        
        }
    }
}

// MARK: UIVIEWCONTROLLER Extenstion

extension UIViewController {
    
    func screenSize() -> CGRect{
        
        let screenSize = UIScreen.main.bounds
        
        return screenSize
        
    }
    
}

// MARK: USERDEFAULTS Extenstion

extension UserDefaults {
    
    func setIsLoggedIn(value: Bool) {
        if value == true {
            set(true, forKey: "IsLoggedIn")
            synchronize()
        }
        else{
            set(false, forKey: "IsLoggedIn")
            synchronize()
            
        }
    }
    
    func IsLoggedIn() -> Bool {
        return bool(forKey: "IsLoggedIn")
    }
    
    func setUserID(UserID: String) {
        
        set(UserID, forKey: "User_ID")
        synchronize()
        
    }
    
    func getUserID() -> String {
        return string(forKey: "User_ID")!
    }
    
    
}

// MARK: CGPOINT Extenstion
extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(self.x - point.x, self.y - point.y)
    }
}


// MARK: UICOLOR Extenstion
extension UIColor {
    static func by(r: Int, g: Int, b: Int, a: CGFloat = 1) -> UIColor {
        let d = CGFloat(255)
        return UIColor(red: CGFloat(r) / d, green: CGFloat(g) / d, blue: CGFloat(b) / d, alpha: a)
    }
    
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

// MARK: UIVIEW Extenstion
extension UIView {
    func pinToSafeArea(top: CGFloat? = 0, left: CGFloat? = 0, bottom: CGFloat? = 0, right: CGFloat? = 0){
        guard let superview = self.superview else { return }
        
        prepareForAutoLayout()
        
        var guide: UILayoutGuide
        if #available(iOS 11.0, *) {
            guide = superview.safeAreaLayoutGuide
        } else {
            guide = superview.layoutMarginsGuide
        }
        
        if let top = top {
            self.topAnchor.constraint(equalTo: guide.topAnchor, constant: top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: guide.bottomAnchor, constant: bottom).isActive = true
        }
        
        if let left = left {
            self.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: left).isActive = true
        }
        
        if let right = right {
            self.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: right).isActive = true
        }
    }
    
    func pinToSuperView(top: CGFloat? = 0, left: CGFloat? = 0, bottom: CGFloat? = 0, right: CGFloat? = 0){
        guard let superview = self.superview else { return }
        
        prepareForAutoLayout()
        
        if let top = top {
            self.topAnchor.constraint(equalTo: superview.topAnchor, constant: top).isActive = true
        }
        
        if let bottom = bottom {
            self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: bottom).isActive = true
        }
        
        if let left = left {
            self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: left).isActive = true
        }
        
        if let right = right {
            self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: right).isActive = true
        }
    }
    
    func centerInSuperView(){
        guard let superview = self.superview else { return }
        
        prepareForAutoLayout()
        
        self.centerXAnchor.constraint(equalTo: superview.centerXAnchor).isActive = true
        self.centerYAnchor.constraint(equalTo: superview.centerYAnchor).isActive = true
    }
    
    func constraint(width: CGFloat){
        prepareForAutoLayout()
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
    }
    
    func constraint(height: CGFloat){
        prepareForAutoLayout()
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    func makeWidthEqualHeight(){
        prepareForAutoLayout()
        self.widthAnchor.constraint(equalTo: self.heightAnchor).isActive = true
    }
    
    func prepareForAutoLayout(){
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    @discardableResult
       func anchor(top: NSLayoutYAxisAnchor? = nil, left: NSLayoutXAxisAnchor? = nil, bottom: NSLayoutYAxisAnchor? = nil, right: NSLayoutXAxisAnchor? = nil, paddingTop: CGFloat = 0, paddingLeft: CGFloat = 0, paddingBottom: CGFloat = 0, paddingRight: CGFloat = 0, width: CGFloat = 0, height: CGFloat = 0) -> [NSLayoutConstraint] {
           translatesAutoresizingMaskIntoConstraints = false
           
           var anchors = [NSLayoutConstraint]()
           
           if let top = top {
               anchors.append(topAnchor.constraint(equalTo: top, constant: paddingTop))
           }
           if let left = left {
               anchors.append(leftAnchor.constraint(equalTo: left, constant: paddingLeft))
           }
           if let bottom = bottom {
               anchors.append(bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom))
           }
           if let right = right {
               anchors.append(rightAnchor.constraint(equalTo: right, constant: -paddingRight))
           }
           if width > 0 {
               anchors.append(widthAnchor.constraint(equalToConstant: width))
           }
           if height > 0 {
               anchors.append(heightAnchor.constraint(equalToConstant: height))
           }
           
           anchors.forEach({$0.isActive = true})
           
           return anchors
       }
       
       @discardableResult
       func anchorToSuperview() -> [NSLayoutConstraint] {
           return anchor(top: superview?.topAnchor, left: superview?.leftAnchor, bottom: superview?.bottomAnchor, right: superview?.rightAnchor)
       }
    
    func applyShadow(radius: CGFloat, opacity: Float, offset: CGSize, color: UIColor = .black) {
        layer.shadowRadius = radius
        layer.shadowOpacity = opacity
        layer.shadowOffset = offset
        layer.shadowColor = color.cgColor
    }
}

// MARK: ARRAY Extenstion
extension Array {
    func safeValue(at index: Int) -> Element? {
        if index < self.count {
            return self[index]
        } else {
            return nil
        }
    }
}

extension UIImage {
    func imageResized(to size: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size: size).image { _ in
            draw(in: CGRect(origin: .zero, size: size))
        }
    }
}
