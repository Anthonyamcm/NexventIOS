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
    
    private var viewModels = [EventViewModel]()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        cardStack.delegate = self
        cardStack.dataSource = self
        layoutCardStackView()
        configureBackgroundGradient()
        fetchEvents()
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
    
    func fetchEvents(){
        Service.fetchEvents { events in
            self.viewModels = events.map({EventViewModel(event: $0)})
            DispatchQueue.main.async {
                let newIndices = Array(0..<self.viewModels.count)
                self.cardStack.appendCards(atIndices: newIndices)
            }
        }
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
        
        let model = viewModels[index]
        card.content = CardContent(image: model.imageURL)
        card.footer = CardFooter(title: "\(model.name)", subtitle: model.company)

            return card
          }
    
    func numberOfCards(in cardStack: SwipeCardStack) -> Int {
        return viewModels.count
    }
    
    func didSwipeAllCards(_ cardStack: SwipeCardStack) {
        print("Swiped all cards!")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didUndoCardAt index: Int, from direction: SwipeDirection) {
        print("Undo \(direction) swipe on \(viewModels[index].name)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSwipeCardAt index: Int, with direction: SwipeDirection) {
        print("Swiped \(direction) on \(viewModels[index].name)")
    }
    
    func cardStack(_ cardStack: SwipeCardStack, didSelectCardAt index: Int) {
        print("Card tapped")
    }
 }

