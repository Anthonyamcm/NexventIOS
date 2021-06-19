//
//  CardModel.swift
//  Nexvent
//
//  Created by Anthony McMillan on 15/04/2021.
//

import Foundation
import UIKit

struct Event {
    
    var name: String
    var company: String
    var imageURL: String
    let uid: String
    
    
    init(dictionary: [String: Any] ) {
        self.name = dictionary["eventTitle"] as? String ?? ""
        self.company = dictionary["companyName"] as? String ?? ""
        self.imageURL = dictionary["image"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
    
}
