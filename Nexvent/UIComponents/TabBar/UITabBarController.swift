//
//  UITabBarController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/04/2021.
//

import Foundation
import UIKit

class TabBarController: UITabBarController {

    fileprivate var shouldSelectOnTabBar = true
    private var circleView : UIView!
    private var circleImageView: UIImageView!
    open override var selectedViewController: UIViewController? {
        willSet {
            guard shouldSelectOnTabBar, let newValue = newValue else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as?   TabBar, let index = viewControllers?.firstIndex(of: newValue) else {return}
            tabBar.select(itemAt: index, animated: true)
        }
    }
    
    open override var selectedIndex: Int {
        willSet {
            guard shouldSelectOnTabBar else {
                shouldSelectOnTabBar = true
                return
            }
            guard let tabBar = tabBar as? TabBar else {
                return
            }
            tabBar.select(itemAt: selectedIndex, animated: true)
        }
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        let tabBar = TabBar()
        self.setValue(tabBar, forKey: "tabBar")
        
        
        
        self.circleView = GradientView(frame: .zero)
        circleView.layer.cornerRadius = 30
        circleView.isUserInteractionEnabled = false
        circleView.layer.shadowOpacity = 0.3
        circleView.layer.shadowRadius = 30.0
        circleView.layer.shadowColor = UIColor.systemBlue.cgColor
        
        self.circleImageView = UIImageView(frame: .zero)
        circleImageView.layer.cornerRadius = 30
        circleImageView.isUserInteractionEnabled = false
        circleImageView.contentMode = .center
        
        circleView.addSubview(circleImageView)
        self.view.addSubview(circleView)
        let tabWidth = self.view.bounds.width / CGFloat(self.tabBar.items?.count ?? 4)
        
        circleView.frame = CGRect(x: tabWidth / 2 - 30, y: self.tabBar.frame.origin.y - 40, width: 60, height: 60)
        circleImageView.frame = self.circleView.bounds
    }
    open override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        circleImageView.image = image(with: self.tabBar.selectedItem?.image ?? self.tabBar.items?.first?.image, scaledTo: CGSize(width: 30, height: 30))
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let idx = 0
        selectedIndex = idx
        let tabWidth = self.view.bounds.width / CGFloat(self.tabBar.items!.count)
        UIView.animate(withDuration: 0.3) {
            self.circleView.frame = CGRect(x: (tabWidth * CGFloat(idx) + tabWidth / 2 - 30), y: self.tabBar.frame.origin.y - 15, width: 60, height: 60)
        }
        UIView.animate(withDuration: 0.15, animations: {
                        self.circleImageView.alpha = 0 }) { (_) in self.circleImageView.image = self.image(with: self.tabBar.items?[idx].image, scaledTo: CGSize(width: 30, height: 30))
            UIView.animate(withDuration: 0.15, animations: {
                            self.circleImageView.alpha = 1
                
            })
        }
        if let controller = viewControllers?[idx] {
            delegate?.tabBarController?(self, didSelect: controller)
            
        }
        
    }
    
    
    private var _barHeight: CGFloat = 74
    open var barHeight: CGFloat {
        get {
            if #available(iOS 11.0, *) {
                return _barHeight + view.safeAreaInsets.bottom
            } else {
                return _barHeight
            }
        }
        set {
            _barHeight = newValue
            updateTabBarFrame()
        }
    }
    
    private func updateTabBarFrame() {
        var tabFrame = self.tabBar.frame
        tabFrame.size.height = barHeight
        tabFrame.origin.y = self.view.frame.size.height - barHeight
        self.tabBar.frame = tabFrame
        tabBar.setNeedsLayout()
    }
    
    open override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        updateTabBarFrame()
    }
    
    open override func viewSafeAreaInsetsDidChange() {
        if #available(iOS 11.0, *) {
            super.viewSafeAreaInsetsDidChange()
        }
        updateTabBarFrame()
    }
    
    open override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        guard let idx = tabBar.items?.firstIndex(of: item) else { return }
        if  idx != selectedIndex, let controller = viewControllers?[idx] {
            shouldSelectOnTabBar = false
            selectedIndex = idx
            let tabWidth = self.view.bounds.width / CGFloat(self.tabBar.items!.count)
            UIView.animate(withDuration: 0.3) {
                self.circleView.frame = CGRect(x: (tabWidth * CGFloat(idx) + tabWidth / 2 - 30), y: self.tabBar.frame.origin.y - 15, width: 60, height: 60)
            }
            UIView.animate(withDuration: 0.15, animations: {
                self.circleImageView.alpha = 0
            }) { (_) in
                self.circleImageView.image = self.image(with: item.image, scaledTo: CGSize(width: 30, height: 30))
                UIView.animate(withDuration: 0.15, animations: {
                    self.circleImageView.alpha = 1
                })
            }
            delegate?.tabBarController?(self, didSelect: controller)
        }
    }
    private func image(with image: UIImage?, scaledTo newSize: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(newSize, _: false, _: 0.0)
        image?.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage: UIImage? = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
    
}

public class GradientView: UIView  {

    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutGradientLabelLayer()
    }

    // MARK: Private
    private func layoutGradientLabelLayer() {
       let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [UIColor(red: (0/255.0), green: (114/255.0), blue: (255/255.0), alpha: 1).cgColor , UIColor(red: (0/255.0), green: (198/255.0), blue: (255/255.0), alpha: 1).cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 0)
        gradient.cornerRadius = 30
        self.layer.insertSublayer(gradient, at: 0)
    }
}
