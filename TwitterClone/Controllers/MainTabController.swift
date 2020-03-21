//
//  MainTabController.swift
//  TwitterClone
//
//  Created by MICHAEL ADU DARKO on 3/13/20.
//  Copyright © 2020 Bronzy. All rights reserved.
//

import UIKit
import Firebase

class MainTabController: UITabBarController {
    
    //MARK:- Properties
    
    var user: User? {
        didSet{
            guard let nav = viewControllers?[0] as? UINavigationController else { return}
            guard let feed = nav.viewControllers.first as? FeedController else {return}
            
            feed.user = user 
        }
    }
    
    let actionButton: UIButton = {
        let button = UIButton(type: .system)
        button.tintColor = .white
        button.backgroundColor = .twitterBlue
        button.setImage(#imageLiteral(resourceName: "new_tweet"), for: .normal)
        button.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
        return button
        
    }()
    
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        logUserOut()
        view.backgroundColor = .twitterBlue
        authenticateUserAndConfigureUI()
        
    }
    
    //MARK:- API
    
    func fetchUser(){
        UserService.shared.fetchUser { user in
            self.user = user
        }
    }
    
    
    func authenticateUserAndConfigureUI(){
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let nav = UINavigationController(rootViewController: LoginController())
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
                
            }
        } else {
            configureViewController()
            configureUI()
            fetchUser()
        }
    }
    
    func logUserOut() {
        do {
            try Auth.auth().signOut()
            print("DEBUG: did log user out ")
        } catch let error {
            print("DEBUG: Failed to signout with error \(error.localizedDescription)")
        }
    }
    //MARK:- selectors
    @objc func actionButtonTapped(){
        let nav = UINavigationController(rootViewController: UploadTweetController())
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true, completion: nil)
    }
    
    //MARK:- Helpers
    func configureUI(){
        view.addSubview(actionButton)
        actionButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor,  paddingBottom: 64,
                             paddingRight: 16, width: 56, height: 56)
        actionButton.layer.cornerRadius = 56 / 2
    }
    
    func configureViewController(){
        
        let feed = FeedController()
        let nav1 = templateNavigationController(image: #imageLiteral(resourceName: "home"), rootViewContoller: feed)
        
        let explore = ExploreController()
        let nav2 = templateNavigationController(image: #imageLiteral(resourceName: "icons8-search-more-100"), rootViewContoller: explore)
        
        let notification = NotificationController()
        let nav3 = templateNavigationController(image: #imageLiteral(resourceName: "notification"), rootViewContoller: notification)
        
        let conversations = ConversationsController()
        let nav4 = templateNavigationController(image: #imageLiteral(resourceName: "message"), rootViewContoller: conversations)
        
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
