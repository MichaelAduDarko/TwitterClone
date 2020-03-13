//
//  MainTabController.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/13/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController {
    
    //MARK:- Properties
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        
    }
    
    //MARK:- Helpers
    
    func configureViewController(){
        
        let feed = FeedController()
        feed.tabBarItem.image = UIImage(named: "home_unselected")
        
        let explore = ExploreController()
        explore.tabBarItem.image = UIImage(named: "search_unselected")
        
        let notification = NotificationController()
        notification.tabBarItem.image = UIImage(named: "search_unselected")
        
        let conversations = ConversationsController()
        conversations.tabBarItem.image = UIImage(named: "search_unselected")
        
        viewControllers = [feed, explore, notification, conversations]
    }
    
}
