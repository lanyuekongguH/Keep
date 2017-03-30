//
//  KPShortcutItems.swift
//  Keep
//
//  Created by Damon on 17/3/29.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

func configureDynamicShortcuts() {
    
    if #available(iOS 9.0, *) {
        var shortcutItems = [UIApplicationShortcutItem]()

        let trainItem = UIApplicationShortcutItem(type: KPShortcutType.Train.rawValue, localizedTitle: "开始一个训练", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "icon_forcetouch_training"), userInfo: nil)
        shortcutItems.append(trainItem)
        
        let runItem = UIApplicationShortcutItem(type: KPShortcutType.Run.rawValue, localizedTitle: "开始户外跑步", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "icon_forcetouch_run"), userInfo: nil)
        shortcutItems.append(runItem)
        
        let notificationsItem = UIApplicationShortcutItem(type: KPShortcutType.Notifications.rawValue, localizedTitle: "查看消息提醒", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "icon_forcetouch_notice"), userInfo: nil)
        shortcutItems.append(notificationsItem)
        
        let scanItem = UIApplicationShortcutItem(type: KPShortcutType.Scan.rawValue, localizedTitle: "扫描二维码", localizedSubtitle: nil, icon: UIApplicationShortcutIcon(templateImageName: "icon_forcetouch_scan"), userInfo: nil)
        shortcutItems.append(scanItem)
        
        UIApplication.shared.shortcutItems = shortcutItems

    } else {
        // Fallback on earlier versions
    }
}

@available(iOS 9.0, *)
func tryQuickActionWithShortcutItem(_ shortcutItem: UIApplicationShortcutItem, inWindow window: UIWindow) {

    guard let shortcutType = KPShortcutType(rawValue: shortcutItem.type) else {
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
    
    switch shortcutType {
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
