//
//  UserService.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/18/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

struct UserService {
    static let shared = UserService()
    
    //Making API Call to fetch user data from firebase
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        REF_USERS.child(uid).observeSingleEvent(of: .value) { snapshot in
            guard let dictionary = snapshot.value as? [String: AnyObject] else {return}
            
            guard let useranme = dictionary["username"] as? String else {return}
            print("DEBUG: Username is \(useranme)")
        }
    }
}
