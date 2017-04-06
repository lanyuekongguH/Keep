//
//  KPTodayWidgetTool.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

func tryQuickActionWithTodayWidget(_ url: URL, inWindow window: UIWindow) {

    guard let hostType = KPShortcutType(rawValue: url.host!) else {
        return
    }

    guard let tabbar = window.rootViewController as? KPTabBarController else {
        return
    }
    
    if let nav = tabbar.selectedViewController as? KPNavigationController  {
        if nav.childViewControllers.count > 1 {
            nav.popToRootViewController(animated: false)
        }
    }
    
    
    switch hostType {
    case .Scan:
        let sportsVc = KPMineSportsController()
        let nav = tabbar.selectedViewController as? KPNavigationController
        nav?.pushViewController(sportsVc, animated: true)
        
    case .Notifications:
        let sportsVc = KPMineSportsController()
        let nav = tabbar.selectedViewController as? KPNavigationController
        nav?.pushViewController(sportsVc, animated: true)
    case .Run:
        let sportsVc = KPMineSportsController()
        let nav = tabbar.selectedViewController as? KPNavigationController
        nav?.pushViewController(sportsVc, animated: true)
        
    case .Train:
        let sportsVc = KPMineSportsController()
        let nav = tabbar.selectedViewController as? KPNavigationController
        nav?.pushViewController(sportsVc, animated: true)
    }
}
