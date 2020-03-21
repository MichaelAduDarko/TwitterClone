//
//  TweetService.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/20/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class TweetService{
    static let shared = TweetService()
    
    func uploadTweert(caption: String, completion: @escaping(Error?, DatabaseReference) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        
        let values = ["uid": uid,
                      "timestamp": Int(NSDate().timeIntervalSince1970),
                      "likes": 0,
                      "retweets": 0,
                      "caption":caption] as [String : Any]
        
        REF_TWEETS.childByAutoId().updateChildValues(values, withCompletionBlock: completion)
    }
}
