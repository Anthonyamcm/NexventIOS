//
//  Card.swift
//  Nexvent
//
//  Created by Anthony McMillan on 15/04/2021.
//
import Foundation
import UIKit
import Shuffle_iOS

class Card: SwipeCard {
    
    override var swipeDirections: [SwipeDirection] {
        return [.left, .right]
    }
    
    init(model: CardModel) {
        super.init(frame: .zero)
        initialize()
        configure(model: model)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
    
    private func initialize() {
        footerHeight = 80
    }
    
    override func overlay(forDirection direction: SwipeDirection) -> UIView? {
        switch direction {
        case .left:
            return cardOverlay.left()
        case.right:
            return cardOverlay.right()
        default:
            return nil
        }
    }
    private func configure(model: CardModel) {
        content = cardContent(image: model.image)
        footer  =  cardFooter(title: "\(model.name)", subtitle: model.location)
    }
}
