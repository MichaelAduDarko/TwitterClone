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
            
            let user = User(uid: uid, dictionary: dictionary)
            
            print("DEBUG: Username is \(user.username)")
            print("DEBUG: Fullname is \(user.fullname)")
        }
    }
}
