//
//  UserViewModel.swift
//  Nexvent
//
//  Created by Anthony McMillan on 19/06/2021.
//

import Foundation

class UserViewModel {
    
    let user: User
    
    var name: String
    
    var email: String
    
    var tags: [String]
    
    var uid: String
    
    init(user: User) {
        self.user = user
        self.name = user.name
        self.email = user.email
        self.tags = user.tags
        self.uid = user.uid
    }
    
    
}
