//
//  EventViewModel.swift
//  Nexvent
//
//  Created by Anthony McMillan on 19/06/2021.
//

import Foundation
class EventViewModel {
    
    let event: Event
    
    var name: String
    
    var company: String
    
    var uid: String
    
    var imageURL: URL
    
    init(event: Event) {
        self.event = event
        self.name = event.name
        self.company = event.company
        self.uid = event.uid
        self.imageURL = URL(string: event.imageURL)!
    }
    
    
}
