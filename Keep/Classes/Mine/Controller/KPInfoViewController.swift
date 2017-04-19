//
//  KPInfoViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPInfoViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = KPBg()

        navigationItem.titleView = segmentView
        
        view.addSubview(segmentedControl)

        segmentedControl.snp.makeConstraints { (make) in
            make.width.equalTo(SCREENW - 20*2)
            make.height.equalTo(30)
            make.top.equalTo(74)
            make.left.equalTo(20)
        }
    }
    
    fileprivate lazy var segmentView: KPSegmentView = {
        let segmentView = KPSegmentView.init(frame: CGRect(x: 0, y: 0, width: 0, height: 44), ["通知","消息"])
        return segmentView
    }()
    
    fileprivate lazy var segmentedControl: UISegmentedControl = {
        
        let items = ["评论", "@我", "粉丝","加油和赞"] as [Any]
        let segmentedControl = UISegmentedControl(items:items)
        segmentedControl.selectedSegmentIndex = 2
        segmentedControl.tintColor = KPTheme()
        
        return segmentedControl
    }()
}

extension KPInfoViewController: KPSegmentViewDelegate {

    func segmentView(_ segmentView:KPSegmentView, button:UIButton) {
    
    
    }

}


