//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.titleView = segmentView

    }

    fileprivate lazy var segmentView: KPSegmentView = {
        let segmentView = KPSegmentView()
        segmentView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        segmentView.titiles = ["好友","小组"]
        return segmentView
    }()
    
    
    
}
