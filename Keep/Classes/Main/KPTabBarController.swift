//
//  KPTabBarController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        addChildViewControllers()
    }

    override class func initialize() {

        let tabbar = UITabBar.appearance()
        tabbar.tintColor = KPColor(111, g: 111, b: 111, a: 1.0)
    }
    
    fileprivate func addChildViewControllers() {
    
        addChildViewController(KPTrainViewController(), title: "训练", imageName: "train", selectedImageName: "train_on")
        addChildViewController(KPDiscoveryController(), title: "发现", imageName: "discovery", selectedImageName: "discovery_on")
        addChildViewController(KPNewsViewController(), title: "动态", imageName: "trends", selectedImageName: "trends_on")
        addChildViewController(KPMineController(), title: "我", imageName: "personal", selectedImageName: "personal_on")
    }
    
    fileprivate func addChildViewController(_ childController: UIViewController, title:String, imageName:String, selectedImageName: String) {
        
        childController.tabBarItem.title = title
        childController.tabBarItem.image = UIImage(named: imageName)
        childController.tabBarItem.selectedImage = UIImage(named: selectedImageName)
        
        let nav = KPNavigationController(rootViewController: childController)
        addChildViewController(nav)
    }
}
