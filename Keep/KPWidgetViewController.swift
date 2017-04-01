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
            self.extensionContext?.widgetLargestAvailableDisplayMode = .compact
        } else {
            // Fallback on earlier versions
        }
        
        self.preferredContentSize = CGSize.init(width: UIScreen.main.bounds.width, height: 263)
        
        print("sssssss")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.view.addSubview(contentView)
        //        self.view.addSubview(runButton)
        //        self.view.addSubview(trainButton)
        //        self.view.addSubview(publish)
        //        self.view.addSubview(scanButton)
        //
        //
        //        runButton.addTarget(self, action: #selector(gotoapp), for: .touchUpInside)
        //        trainButton.addTarget(self, action: #selector(gotoapp), for: .touchUpInside)
        //        publish.addTarget(self, action: #selector(gotoapp), for: .touchUpInside)
        //        scanButton.addTarget(self, action: #selector(gotoapp), for: .touchUpInside)
        
        
        
        let buttonW = 70
        
        let buttonD = (UIScreen.main.bounds.width - 20*2 - CGFloat(buttonW) * 4)/3.0
        
        runButton.frame = CGRect.init(x: 20, y: 20, width: buttonW, height: 70)
        
        trainButton.frame = CGRect.init(x:(Int(20.0 + CGFloat(buttonW) + CGFloat(buttonD))), y: 20, width: buttonW, height: 70)
        publish.frame = CGRect.init(x: (Int(20 + CGFloat(buttonW) * 2 + CGFloat(buttonD) * 2)), y: 20, width: buttonW, height: 70)
        scanButton.frame = CGRect.init(x: (Int(20 + CGFloat(buttonW) * 3 + CGFloat(buttonD) * 3)), y: 20, width: buttonW, height: 70)
        
        
        let button = UIButton()
        button.frame = CGRect.init(x: 0, y: 0, width: 50, height: 50)
        button.backgroundColor = UIColor.red
        button.addTarget(self, action: #selector(buttonClick), for: .touchUpInside)
        
        self.view.addSubview(button)
    }
    
    func buttonClick() {
        
    }
    
    func gotoapp() {
        
        //        self.extensionContext?.open(URL(string: "cmb.widget")!, completionHandler: { (success) in
        //
        //            print("ssssssseeeee")
        //        })
    }
    
    fileprivate lazy var contentView: UIView = {
        
        let contentView = UIView()
        contentView.frame = CGRect.init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 110)
        contentView.backgroundColor = UIColor.gray
        contentView.isUserInteractionEnabled = true
        return contentView
    }()
    
    fileprivate lazy var runButton: KPWidgetButton = {
        
        let runButton = KPWidgetButton.init(frame:CGRect.init(x: 20, y: 20, width: 60, height: 70), imageName:"icon_widget_run", title:"开始跑步")
        runButton.addTarget(self, action: #selector(gotoapp), for: .touchUpInside)
        return runButton
    }()
    
    fileprivate lazy var trainButton: KPWidgetButton = {
        
        let trainButton = KPWidgetButton.init(frame:CGRect.init(x: 40+60, y: 20, width: 60, height: 70), imageName:"icon_widget_train", title:"开始训练")
        
        return trainButton
    }()
    
    fileprivate lazy var publish: KPWidgetButton = {
        
        let publish = KPWidgetButton.init(frame:CGRect.init(x: 60+60*2, y: 20, width: 60, height: 70), imageName:"icon_widget_write", title:"发布动态")
        
        return publish
    }()
    
    fileprivate lazy var scanButton: KPWidgetButton = {
        
        let scanButton = KPWidgetButton.init(frame:CGRect.init(x: 60+60*3, y: 0, width: 60, height: 70), imageName:"icon_widget_scan", title:"扫一扫")
        
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
