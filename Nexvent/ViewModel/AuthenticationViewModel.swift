//
//  AuthenticationViewModel.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/06/2021.
//

import Foundation

protocol AuthenticationViewModelProtocol {
    var isFormValid: Bool {get}
}

struct loginViewModel {
    var email: String?
    var password: String?
    
    var isFormValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false
    }
}

struct registerViewModel {
    var email: String?
    var fullName: String?
    var password: String?
    
    var isFormValid: Bool {
        return email?.isEmpty == false && password?.isEmpty == false && fullName?.isEmpty == false
    }
}
