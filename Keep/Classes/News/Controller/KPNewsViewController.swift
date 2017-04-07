//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit


class KPNewsViewController: UIViewController {

    fileprivate var hotItems = [KPNewsHotItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadBannerData()
    }

    fileprivate func setupUI() {
    
        view.backgroundColor = KPBg()
        
        navigationItem.titleView = segmentView
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(rightItemClick))
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "add"), style: .plain, target: self, action: #selector(leftItemClick))
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
    
    }
    
    fileprivate func loadBannerData() {
        
        KPNetworkTool.shareNetworkTool.loadNewsHotData{ [weak self](hotItems) in
            
            self?.hotItems = hotItems
            
            print(hotItems)
        }
        
    }
    
//    fileprivate lazy var segmentView: KPStoreTabView = {
//        let segmentView = KPSegmentView()
//        segmentView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
//        segmentView.titiles = ["好友","小组"]
//        return segmentView
//    }()
    
    fileprivate lazy var segmentView: KPSegmentView = {
        let segmentView = KPSegmentView()
        segmentView.frame = CGRect(x: 0, y: 0, width: 100, height: 44)
        segmentView.titiles = ["好友","小组"]
        return segmentView
    }()
    
    
    func rightItemClick() {
        let publishVC = KPPublishViewController()
        let nav = KPNavigationController.init(rootViewController: publishVC)
        self.present(nav, animated: true, completion:
            nil)
    }
    
    func leftItemClick() {
        let addFriendVC = KPAddFriendController()
        navigationController?.pushViewController(addFriendVC, animated: true)
        
    }
}



