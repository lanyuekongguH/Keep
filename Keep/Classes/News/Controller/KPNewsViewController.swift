//
//  KPNewsViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

let KPStoreCarouselCellIdentifier = "KPStoreCarouselCellIdentifier"
let KPStoreBannerCellIdentifier = "KPStoreBannerCellIdentifier"
let KPStoreProductCellIdentifier = "KPStoreProductCellIdentifier"

class KPNewsViewController: UIViewController {

    fileprivate var banners = [KPStoreBanner]()

    var tableView: UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        loadBannerData()
    }

    fileprivate func setupUI() {
    
        view.backgroundColor = KPBg()
        
        navigationItem.titleView = segmentView
        
        let tableView = UITableView.init(frame: view.bounds, style: .grouped)
        
        tableView.register(KPStoreCarouselCell.self, forCellReuseIdentifier: KPStoreCarouselCellIdentifier)
        tableView.register(KPStoreBannerCell.self, forCellReuseIdentifier: KPStoreBannerCellIdentifier)
        tableView.register(KPStoreProductCell.self, forCellReuseIdentifier: KPStoreProductCellIdentifier)

        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
        
    }
    
    fileprivate func loadBannerData() {
        
        KPNetworkTool.shareNetworkTool.loadStoreBannerData{ [weak self](banners) in
            
            self?.banners = banners
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
}

extension KPNewsViewController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
}

extension KPNewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = UITableViewCell()
        
        if indexPath.section == 0 {
            
            cell = tableView.dequeueReusableCell(withIdentifier: KPStoreCarouselCellIdentifier) as! KPStoreCarouselCell
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: KPStoreBannerCellIdentifier) as! KPStoreBannerCell
            
            var mineListCell = KPStoreBannerCell()
            mineListCell = cell as! KPStoreBannerCell;
            
            mineListCell.banners = banners
            return mineListCell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 || indexPath.section == 2 {
            return 190
        } else {
            return 100
        }
    }
    
}


