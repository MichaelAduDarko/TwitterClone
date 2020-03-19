//
//  AuthService.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/14/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

struct AuthCredentials {
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

struct AuthService {
    static let shared = AuthService()
    
    // Login User Authentication
    func logUserIn(withemail email: String, password: String, comnpletion: AuthDataResultCallback?){
        Auth.auth().signIn(withEmail: email, password: password, completion: comnpletion)
        
    }
    
    
    //Sign Up user authentication
    func registerUser(credentials: AuthCredentials, completion: @escaping(Error? , DatabaseReference?)-> Void)  {
        let email = credentials.email
        let password = credentials.password
        
        let fullname = credentials.fullname
        let username = credentials.username
        
        
        guard let imageData = credentials.profileImage.jpegData(compressionQuality: 0.3) else {return}
               let filename = NSUUID().uuidString
               let storageRef = STORAGE_PROFILE_IMAGES.child(filename)
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            guard let uid = result?.user.uid else {return}
            
            if let error = error {
                print("DEBUG: Error is \(error.localizedDescription)")
                return
            }
        
            storageRef.putData(imageData, metadata: nil) { (meta, error) in
                storageRef.downloadURL { (imageURL, error) in
                    guard error == nil else {
                        completion(error, nil)
                        return
                    }
                    
                    guard let profileImageURL = imageURL?.absoluteString else {
                        completion(error, nil)
                        return
                    }
                    let values: [String: String] = ["email": email,"username": username,"fullname": fullname, "profileImageUrl": profileImageURL]
                    REF_USERS.child(uid).updateChildValues(values) { (error, ref) in
                        completion(error, ref)
                    }
                }
            }
        }
    }
}

