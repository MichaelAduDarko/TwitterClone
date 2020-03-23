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
    
    func fetchTweets(completion: @escaping([Tweet])-> Void){
        var tweets = [Tweet]()
        
        REF_TWEETS.observe(.childAdded) { (snapshot) in
            guard let dictionary = snapshot.value as? [String: Any] else {return}
            let  tweetID = snapshot.key
            
            let tweet = Tweet(tweetID: tweetID, dictionary: dictionary)
            tweets.append(tweet)
            completion(tweets)
            
        }
    }
}
