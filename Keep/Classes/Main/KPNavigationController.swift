//
//  KPNavigationController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override class func initialize() {
        
        super.initialize()
        
        let navBar = UINavigationBar.appearance()
        navBar.barTintColor = KPTheme()
        navBar.tintColor = UIColor.white
        navBar.titleTextAttributes = [
            NSFontAttributeName: UIFont.systemFont(ofSize: 17),NSForegroundColorAttributeName: UIColor.white]
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if viewControllers.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backClick))
        }
        super.pushViewController(viewController, animated: true)
    }
    
    @objc fileprivate func backClick(){
        popViewController(animated: true)
    }

}
