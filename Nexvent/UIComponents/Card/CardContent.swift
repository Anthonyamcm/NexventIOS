//
//  CardContent.swift
//  Nexvent
//
//  Created by Anthony McMillan on 15/04/2021.
//

import Foundation
import UIKit
import SDWebImage

class CardContent: UIView {
    private let backgroundView: UIView = {
        let background = UIView()
        background.clipsToBounds = true
        background.layer.cornerRadius = 32
        return background
    }()
    
    private let imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        return iv
    }()
    
    private let gradientLayer: CAGradientLayer = {
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.withAlphaComponent(0.01).cgColor,
                           UIColor.black.withAlphaComponent(0.8).cgColor]
        gradient.startPoint = CGPoint(x: 0.5, y: 0)
        gradient.endPoint = CGPoint(x: 0.5, y: 1)
        return gradient
    }()
    
    init(image: URL) {
        super.init(frame: .zero)
        imageView.sd_setImage(with: image)
        initialize()
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func initialize() {
        addSubview(backgroundView)
        backgroundView.anchorToSuperview()
        backgroundView.addSubview(imageView)
        imageView.anchorToSuperview()
        applyShadow(radius: 8, opacity: 0.2, offset: CGSize(width: 0, height: 2))
        backgroundView.layer.insertSublayer(gradientLayer, above: imageView.layer)
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        let heightFactor: CGFloat = 0.35
        gradientLayer.frame = CGRect(x: 0, y: (1 - heightFactor) * bounds.height,
                                     width: bounds.width,
                                     height: heightFactor * bounds.height)
    }
}
