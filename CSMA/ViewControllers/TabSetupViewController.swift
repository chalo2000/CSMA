//
//  TabSetupViewController.swift
//  CSMA
//
//  Created by Gonzalo Gonzalez on 1/10/19.
//  Copyright © 2019 Gonzalo Gonzalez. All rights reserved.
//

import UIKit

class TabSetupViewController: UIViewController {

    var tabs: UITabBarController!
    var searchView: SearchViewController!
    var mainFeedView: MainFeedViewController!
    var profileView: ProfileViewController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(true, animated: false)
        createTabBarController()
    }

    func createTabBarController(){
        
        tabs = UITabBarController()
        
        
        searchView = SearchViewController()
        searchView.tabBarItem.image = UIImage(named: "Search Icon")
        searchView.tabBarItem.title = "Search"

        
        mainFeedView = MainFeedViewController()
        mainFeedView.tabBarItem.image = UIImage(named: "Feed Icon")
        mainFeedView.tabBarItem.title = "Feed"
        
        profileView = ProfileViewController()
        profileView.tabBarItem.image = UIImage(named: "Profile Icon")
        profileView.tabBarItem.title = "Profile"
        
        tabs.viewControllers = [searchView, mainFeedView, profileView]
        
        view.addSubview(tabs.view)

    }

}
