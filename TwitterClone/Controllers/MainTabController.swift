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
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .mainBlue
        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewController()
        configureUI()
        
    }
    
    //MARK:- Helpers
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 64,
                             paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    //MARK:- selectors
    @objc func actionButtonTapped(){
        print("1234")
    }
    
    
    func configureViewController(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: #imageLiteral(resourceName: "home_unselected"), rootViewContoller: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: #imageLiteral(resourceName: "search_unselected"), rootViewContoller: explore)
        
        let notification = NotificationController()
        let nav3 = templateNavigationController(image: #imageLiteral(resourceName: "like_unselected"), rootViewContoller: notification)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: #imageLiteral(resourceName: "ic_mail_outline_white_2x-1"), rootViewContoller: conversations)
        
        viewControllers = [nav1, nav2, nav3, nav4]
    }
    
    func templateNavigationController(image:UIImage, rootViewContoller: UIViewController) ->
        UINavigationController {
            let nav = UINavigationController(rootViewController: rootViewContoller)
            nav.tabBarItem.image = image
            nav.navigationBar.barTintColor = .white
            return nav
    }
}
