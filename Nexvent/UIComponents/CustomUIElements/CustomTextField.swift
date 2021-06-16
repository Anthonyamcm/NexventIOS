//
//  CustomTextField.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/06/2021.
//

import UIKit

class CustomTextField: UITextField {
    init(placeholder: String) {
        super.init(frame: .zero)
        
        translatesAutoresizingMaskIntoConstraints = false
        adjustsFontSizeToFitWidth = true
        layer.masksToBounds = false
        backgroundColor = .white
        textColor = .black
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.lightGray])
        layer.cornerRadius = 6
        layer.borderWidth = 1.5
        layer.borderColor = UIColor.lightGray.cgColor
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        setLeftPaddingPoints(15)
        font = UIFont(name: "GTEestiDisplay-Medium", size: 22)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
