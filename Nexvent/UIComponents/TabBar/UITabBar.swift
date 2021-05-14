//
//  UITabBar.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/04/2021.
//

import Foundation
import UIKit

protocol TabBarDelegate: AnyObject {
    func TabBar(_ sender: UITabBar, didSelectItemAt index: Int)
}

open class UITabBar: UIView {
    
    weak var delegate: TabBarDelegate?
    
    var items: [UITabBarItem] = [] {
        didSet {
            reloadViews()
        }
    }
    
    override open func tintColorDidChange() {
        super.tintColorDidChange()
        reloadApperance()
    }
    
    func reloadApperance(){
        
        buttons().forEach { button in
            button.selectedColor = UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1)
        }
        
        indicatorView.tintColor = tintColor
    }
    
    lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.alignment = .center
        
        return stackView
    }()
    
    
    lazy var indicatorView: UITabBarIndicator = {
        let view = UITabBarIndicator()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.constraint(width: 7.5)
        view.backgroundColor = tintColor
        view.makeWidthEqualHeight()
        
        return view
    }()
    
    
    private var indicatorViewYConstraint: NSLayoutConstraint!
    private var indicatorViewXConstraint: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    deinit {
        stackView.arrangedSubviews.forEach {
            if let button = $0 as? UIControl {
                button.removeTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
            }
        }
    }
    
    private func setup(){
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stackView)
        addSubview(indicatorView)
        

        self.backgroundColor = .white
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = 6
        self.layer.shadowOpacity = 0.15
        
        indicatorViewYConstraint?.isActive = false
        indicatorViewYConstraint = indicatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10.5)
        indicatorViewYConstraint.isActive = true
        
        tintColorDidChange()
    }
    
    func add(item: UITabBarItem){
        self.items.append(item)
        self.addButton(with: item.image!)
    }
    
    func remove(item: UITabBarItem){
        if let index = self.items.firstIndex(of: item) {
            self.items.remove(at: index)
            let view = self.stackView.arrangedSubviews[index]
            self.stackView.removeArrangedSubview(view)
        }
    }
    
    private func addButton(with image: UIImage){
        let button = UITabBarButton(image: image)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.selectedColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
        
        button.addTarget(self, action: #selector(buttonTapped(sender:)), for: .touchUpInside)
        self.stackView.addArrangedSubview(button)
    }
    
    func select(at index: Int, notifyDelegate: Bool = true){
        for (bIndex, view) in stackView.arrangedSubviews.enumerated() {
            if let button = view as? UIButton {
                button.tintColor =  bIndex == index ? UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0) : UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
            }
        }
        
        if notifyDelegate {
            self.delegate?.TabBar(self, didSelectItemAt: index)
        }
    }
    
    
    func reloadViews(){
        indicatorViewYConstraint?.isActive = false
        indicatorViewYConstraint = indicatorView.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: -10.5)
        indicatorViewYConstraint.isActive = true
        
        
        for button in (stackView.arrangedSubviews.compactMap { $0 as? UITabBarButton }) {
            stackView.removeArrangedSubview(button)
            button.removeFromSuperview()
            button.removeTarget(self, action: nil, for: .touchUpInside)
        }
        
        for item in items {
            if let image = item.image {
                addButton(with: image)
            } else {
                addButton(with: UIImage())
            }
        }
        
        select(at: 0)
    }
    
    
    
    private func buttons() -> [UITabBarButton] {
        return stackView.arrangedSubviews.compactMap { $0 as? UITabBarButton }
    }
    
    func select(at index: Int){
        /* move the indicator view */
        if indicatorViewXConstraint != nil {
            indicatorViewXConstraint.isActive = false
            indicatorViewXConstraint = nil
        }
        
        for (bIndex, button) in buttons().enumerated() {
            button.selectedColor = UIColor(red: 70/256, green: 56/256, blue: 83/256, alpha: 1.0)
            button.isSelected = bIndex == index
            
            if bIndex == index {
                indicatorViewXConstraint = indicatorView.centerXAnchor.constraint(equalTo: button.centerXAnchor)
                indicatorViewXConstraint.isActive = true
            }
        }
        
        UIView.animate(withDuration: 0.25) {
            self.layoutIfNeeded()
        }
        
        
        self.delegate?.TabBar(self, didSelectItemAt: index)
    }
    
    
    @objc func buttonTapped(sender: UITabBarButton){
        if let index = stackView.arrangedSubviews.firstIndex(of: sender){
            select(at: index)
        }
    }
    
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let position = touches.first?.location(in: self) else {
            super.touchesEnded(touches, with: event)
            return
        }
        
        let buttons = self.stackView.arrangedSubviews.compactMap { $0 as? UITabBarButton }.filter { !$0.isHidden }
        let distances = buttons.map { $0.center.distance(to: position) }
        
        let buttonsDistances = zip(buttons, distances)
        
        if let closestButton = buttonsDistances.min(by: { $0.1 < $1.1 }) {
            buttonTapped(sender: closestButton.0)
        }
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = bounds.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 8, right: 0))
        layer.cornerRadius = 12
    }
}
