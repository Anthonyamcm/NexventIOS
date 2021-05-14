//
//  CardStackViewController.swift
//  Nexvent
//
//  Created by Anthony McMillan on 15/04/2021.
//

import Foundation
import UIKit
import Shuffle_iOS


class CardStackViewController: UIViewController {
    
    private let cardStack = SwipeCardStack()
    
    private let cardModels = [
        
        CardModel(name: "Michelle",
                                location: "Graphic Designer",
                                image: UIImage(named: "party")),
        CardModel(name: "Joshua",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
        CardModel(name: "Mathew",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
        CardModel(name: "Fraser",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
        CardModel(name: "Scott",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
        CardModel(name: "Me",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
        CardModel(name: "Erin",
                               location: "Graphic Designer",
                               image: UIImage(named: "party")),
    ]
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        cardStack.delegate = self
        cardStack.dataSource = self
        layoutCardStackView()
        configureBackgroundGradient()
    }
    
    private func configureBackgroundGradient() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [UIColor.white.cgColor, UIColor.white.cgColor]
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    private func layoutCardStackView() {
        view.addSubview(cardStack)
        cardStack.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: -10, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    @objc private func handleShift(_ sender: UIButton) {
        cardStack.shift(withDistance: sender.tag == 1 ? -1 : 1, animated: true)
    }
}

//MARK: Data Source + Delegates
extension CardStackViewController: SwipeCardStackDataSource, SwipeCardStackDelegate {
    
    
    func cardStack(_ cardStack: SwipeCardStack, cardForIndexAt index: Int) -> SwipeCard {
        let card = SwipeCard()
            card.footerHeight = 80
            card.swipeDirections = [.left, .right]
            for direction in card.swipeDirections {
              card.setOverlay(CardOverlay(direction: direction), forDirection: direction)
    }
        
        let model = cardModels[index]
        card.content = CardContent(image: model.image)
        card.footer = CardFooter(title: "\(model.name)", subtitle: model.location)

            return card
          }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return cardModels.count
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        print("Swiped all cards!")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        print("Undo \(direction) swipe on \(cardModels[index].name)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        print("Swiped \(direction) on \(cardModels[index].name)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Card tapped")
    }
 }

