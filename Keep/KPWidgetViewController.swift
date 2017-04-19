//
//  KPWidgetViewController.swift
//  KeepToday
//
//  Created by Damon on 17/3/31.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import NotificationCenter

class KPWidgetViewController: UIViewController, NCWidgetProviding {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if #available(iOSApplicationExtension 10.0, *) {
            self.extensionContext?.widgetLargestAvailableDisplayMode = .expanded
        } else {
            // Fallback on earlier versions
        }
        
        self.preferredContentSize = CGSize.init(width: UIScreen.main.bounds.width, height: 263)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(runButton)
        self.view.addSubview(trainButton)
        self.view.addSubview(publishButton)
        self.view.addSubview(scanButton)
        
        let buttonW = 70
        
        let buttonD = (UIScreen.main.bounds.width - 20*2 - CGFloat(buttonW) * 4)/3.0
        
        runButton.frame = CGRect.init(x: 20, y: 20, width: buttonW, height: 70)
        trainButton.frame = CGRect.init(x:(Int(20.0 + CGFloat(buttonW) + CGFloat(buttonD))), y: 20, width: buttonW, height: 70)
        publishButton.frame = CGRect.init(x: (Int(20 + CGFloat(buttonW) * 2 + CGFloat(buttonD) * 2)), y: 20, width: buttonW, height: 70)
        scanButton.frame = CGRect.init(x: (Int(20 + CGFloat(buttonW) * 3 + CGFloat(buttonD) * 3)), y: 20, width: buttonW, height: 70)
    }
    
    func gotoapp(_ button:UIButton) {
        
        var hostStr: String!
        
        switch button.tag {
        case 1: hostStr = "Keep.Shortcut.Run"
        case 2: hostStr = "Keep.Shortcut.Train"
        case 3: hostStr = "Keep.Shortcut.Notifications"
        case 4: hostStr = "Keep.Shortcut.Scan"
        default:
            hostStr = "Keep.Shortcut.Run"
        }
        
        self.extensionContext?.open(URL(string: "com.cmb.widget://\(hostStr)")!, completionHandler: { (success) in
        })
    }
    
    fileprivate lazy var runButton: KPWidgetButton = {
        
        let runButton = KPWidgetButton.init(frame:CGRect.init(x: 20, y: 20, width: 60, height: 70), imageName:"icon_widget_run", title:"开始跑步")
        runButton.tag = 1
        runButton.addTarget(self, action: #selector(gotoapp(_:)), for: .touchUpInside)
        return runButton
    }()
    
    fileprivate lazy var trainButton: KPWidgetButton = {
        
        let trainButton = KPWidgetButton.init(frame:CGRect.init(x: 40+60, y: 20, width: 60, height: 70), imageName:"icon_widget_train", title:"开始训练")
        trainButton.tag = 2
        trainButton.addTarget(self, action: #selector(gotoapp(_:)), for: .touchUpInside)

        return trainButton
    }()
    
    fileprivate lazy var publishButton: KPWidgetButton = {
        
        let publishButton = KPWidgetButton.init(frame:CGRect.init(x: 60+60*2, y: 20, width: 60, height: 70), imageName:"icon_widget_write", title:"发布动态")
        publishButton.tag = 3
        publishButton.addTarget(self, action: #selector(gotoapp(_:)), for: .touchUpInside)

        return publishButton
    }()
    
    fileprivate lazy var scanButton: KPWidgetButton = {
        
        let scanButton = KPWidgetButton.init(frame:CGRect.init(x: 60+60*3, y: 0, width: 60, height: 70), imageName:"icon_widget_scan", title:"扫一扫")
        scanButton.tag = 4
        scanButton.addTarget(self, action: #selector(gotoapp(_:)), for: .touchUpInside)

        return scanButton
    }()
    
    @available(iOSApplicationExtension 10.0, *)
    func widgetActiveDisplayModeDidChange(_ activeDisplayMode: NCWidgetDisplayMode, withMaximumSize maxSize: CGSize) {
        
        switch activeDisplayMode {
            
        case .compact:
            
            self.preferredContentSize = CGSize.init(width: UIScreen.main.bounds.width, height: 110)
            
        case .expanded:
            self.preferredContentSize = CGSize.init(width: UIScreen.main.bounds.width, height: 263)
            
        }
        
    }
    
    
    func widgetPerformUpdate(completionHandler: (@escaping (NCUpdateResult) -> Void)) {
        // Perform any setup necessary in order to update the view.
        
        // If an error is encountered, use NCUpdateResult.Failed
        // If there's no update required, use NCUpdateResult.NoData
        // If there's an update, use NCUpdateResult.NewData
        
        completionHandler(NCUpdateResult.newData)
    }
    
}
