//
//  KPNewsHotVideoController.swift
//  Keep
//
//  Created by Damon on 17/4/18.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import MJRefresh

let KPNewsHotVideoCellIdentifier = "KPNewsHotVideoCellIdentifier"

class KPNewsHotVideoController: KPBaseViewController {
    
    var lastId: String?

    var tableView: UITableView?

    var refreshControl = UIRefreshControl()
    
    let footer = MJRefreshAutoNormalFooter()
    
    fileprivate var itemsArray = [KPHotDetailItem]()

    override func viewDidLoad() {
        
        super.viewDidLoad()

        setupUI()
        
        loadHotVideoListData()
    }

    @objc fileprivate func loadHotVideoListData() {
        
        KPNetworkTool.shareNetworkTool.loadNewsHotVideoData(last: lastId) {
            
            [weak self] (item, lastId) in
            
            if self?.lastId != nil {
                
                self?.itemsArray.append(contentsOf: item)
                self?.tableView?.mj_footer.endRefreshing()
                
            } else {
                self?.itemsArray = item
            }
            
            self?.lastId = lastId

            self?.tableView?.reloadData()
        }
    }

    fileprivate func setupUI() {
        
        navigationItem.title = "热门视频"
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.backgroundColor = KPTable()
        
        tableView.register(KPNewsHotVideoCell.self, forCellReuseIdentifier: KPNewsHotVideoCellIdentifier)
                
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
        
        refreshControl.addTarget(self, action: #selector(loadHotVideoListData), for: .valueChanged)
        self.tableView?.addSubview(refreshControl)
        
        footer.setRefreshingTarget(self, refreshingAction: #selector(KPNewsHotVideoController.loadHotVideoListData))
        self.tableView?.mj_footer = footer
    }
}

extension KPNewsHotVideoController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.section == 1 {
            
        }
    }
}

extension KPNewsHotVideoController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPNewsHotVideoCellIdentifier) as! KPNewsHotVideoCell
        cell.hotDetailItem = itemsArray[indexPath.row]
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return KPNewsHotVideoCell.heightOfHotVideoCell(itemsArray[indexPath.row])
    }
    
}
