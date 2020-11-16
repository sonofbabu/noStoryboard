//
//  MainTabBarViewController.swift
//  noStoryboard
//
//  Created by leyo babu on 15/11/20.
//  Copyright © 2020 leyo babu. All rights reserved.
//

import UIKit

class MainTabBarViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.settingTabBar()
        self.setuptabBar()
        // Do any additional setup after loading the view.
    }

// MARK:- SETTING BOTTOM TAB BAR
//    func settingTabBar(){
//        let viewController = UINavigationController(rootViewController: ViewController())
//        viewController.tabBarItem.image = UIImage(named: "homeGray")
//        viewController.tabBarItem.selectedImage = UIImage(named: "graphGrey")
//        let searchViewController = UINavigationController(rootViewController: SearchViewController())
//        searchViewController.tabBarItem.image = UIImage(named: "homeGray")
//        searchViewController.tabBarItem.selectedImage = UIImage(named: "graphGrey")
//
//        viewControllers = [viewController,searchViewController]
//    }
    
    func setuptabBar(){
        let layout = UICollectionViewFlowLayout()
        let viewController = UINavigationController(rootViewController: ViewController())
        
    }

    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tabBar.frame.size.height = 95
        tabBar.frame.origin.y = view.frame.height - 95
    }
}

