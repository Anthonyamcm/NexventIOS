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

extension UIBezierPath {
    convenience init(lineSegment: LineSegment) {
        self.init()
        self.move(to: lineSegment.startPoint)
        self.addLine(to: lineSegment.endPoint)
    }
}

extension CALayer {

    func addLineLayer(lineSegment: LineSegment, color: CGColor, width: CGFloat, isDashed: Bool, animated: Bool, oldSegment: LineSegment?) {
        let layer = CAShapeLayer()
        layer.path = UIBezierPath(lineSegment: lineSegment).cgPath
        layer.fillColor = UIColor.clear.cgColor
        layer.strokeColor = color
        layer.lineWidth = width
        if isDashed {
            layer.lineDashPattern = [4, 4]
        }
        self.addSublayer(layer)
        
        if animated, let segment = oldSegment {
            layer.animate(
                fromValue: UIBezierPath(lineSegment: segment).cgPath,
                toValue: layer.path!,
                keyPath: "path")
        }
    }
    
    func addTextLayer(frame: CGRect, color: CGColor, fontSize: CGFloat, text: String, animated: Bool, oldFrame: CGRect?) {
        let textLayer = CATextLayer()
        textLayer.frame = frame
        textLayer.foregroundColor = color
        textLayer.backgroundColor = UIColor.clear.cgColor
        textLayer.alignmentMode = CATextLayerAlignmentMode.center
        textLayer.contentsScale = UIScreen.main.scale
        textLayer.font = UIFont(name: "GTEestiDisplay-Medium", size: 14)
        textLayer.fontSize = fontSize
        textLayer.string = text
        self.addSublayer(textLayer)
        
        if animated, let oldFrame = oldFrame {
            // "frame" property is not animatable in CALayer, so, I use "position" instead
            // Position is at the center of the frame (if you don't change the anchor point)
            let oldPosition = CGPoint(x: oldFrame.midX, y: oldFrame.midY)
            textLayer.animate(fromValue: oldPosition, toValue: textLayer.position, keyPath: "position")
        }
    }
    
    func addCircleLayer(origin: CGPoint, radius: CGFloat, color: CGColor, animated: Bool, oldOrigin: CGPoint?) {
        let layer = CALayer()
        layer.frame = CGRect(x: origin.x, y: origin.y, width: radius * 2, height: radius * 2)
        layer.backgroundColor = color
        layer.cornerRadius = radius
        self.addSublayer(layer)
        
        if animated, let oldOrigin = oldOrigin {
            let oldFrame = CGRect(x: oldOrigin.x, y: oldOrigin.y, width: radius * 2, height: radius * 2)
            
            // "frame" property is not animatable in CALayer, so, I use "position" instead
            layer.animate(fromValue: CGPoint(x: oldFrame.midX, y: oldFrame.midY),
                          toValue: CGPoint(x: layer.frame.midX, y: layer.frame.midY),
                          keyPath: "position")
        }
    }
    
    func addRectangleLayer(frame: CGRect, color: CGColor, animated: Bool, oldFrame: CGRect?) {
        let layer = CALayer()
        layer.frame = frame
        layer.cornerRadius = 4
        layer.backgroundColor = color
        
        let gradient = CAGradientLayer()
         gradient.frame = layer.bounds
        gradient.colors = [UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1).cgColor , UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1).cgColor]
         gradient.startPoint = CGPoint(x: 1, y: 1)
         gradient.endPoint = CGPoint(x: 1, y: 0)
         gradient.cornerRadius = 6
         layer.addSublayer(gradient)
         self.addSublayer(layer)
        
        if animated, let oldFrame = oldFrame {
            layer.animate(fromValue: CGPoint(x: oldFrame.midX, y: oldFrame.midY), toValue: layer.position, keyPath: "position")
            layer.animate(fromValue: CGRect(x: 0, y: 0, width: oldFrame.width, height: oldFrame.height), toValue: layer.bounds, keyPath: "bounds")
        }
    }
    
    func animate(fromValue: Any, toValue: Any, keyPath: String) {
        let anim = CABasicAnimation(keyPath: keyPath)
        anim.fromValue = fromValue
        anim.toValue = toValue
        anim.duration = 0.5
        anim.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        self.add(anim, forKey: keyPath)
    }
}
