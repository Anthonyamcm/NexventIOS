//
//  UserModel.swift
//  Nexvent
//
//  Created by Anthony McMillan on 09/05/2021.
//

import Foundation

struct User {
    
    var name: String
    var email: String
    let uid: String
    
    init(dictionary: [String: Any] ) {
        self.name = dictionary["fullName"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
    }
}
