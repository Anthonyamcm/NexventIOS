//
//  Service.swift
//  Nexvent
//
//  Created by Anthony McMillan on 19/06/2021.
//

import Foundation

struct Service {
    static func fetchUser(withUid uid: String, completion: @escaping(User) -> Void){
        COLLECTION_USERS.document(uid).getDocument { snapshot, error in
            guard let dict = snapshot?.data() else{return}
            let user = User(dictionary: dict)
            completion(user)
        }
    }
    
    static func fetchEvents(completeion: @escaping([Event]) -> Void){
        var events = [Event]()
        
        COLLECTION_EVENTS.getDocuments { snapshot, error in
            snapshot?.documents.forEach({ document in
                let dict = document.data()
                let event = Event(dictionary: dict)
                
                events.append(event)
                
                if events.count == snapshot?.documents.count{
                    completeion(events)
                }
            })
        }
        
        
        
        
        
        
    }
}
