//
//  AuthService.swift
//  Nexvent
//
//  Created by Anthony McMillan on 16/06/2021.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullName: String
}

struct AuthService {
    
    static func logUserIn(withEmail email: String, password: String, completion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: email, password: password, completion: completion)
    }
    
    
    static func registerUser(withCredientials credentails: AuthCredentials, completion: @escaping ((Error?) -> Void)){
        Auth.auth().createUser(withEmail: credentails.email, password: credentails.password) { result, error in
            if let error = error {
                print("DEBUG: Error signing user up \(error.localizedDescription)")
                return
            }
            guard let uid = result?.user.uid else {return}
            let data = ["email": credentails.email,
                        "fullName": credentails.fullName,
                        "uid": uid]
            
            COLLECTION_USERS.document(uid).setData(data, completion: completion)
        }
        
    }
}
