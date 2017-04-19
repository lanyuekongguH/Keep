//
//  KPNewsHotVideoController.swift
//  Keep
//
//  Created by Damon on 17/4/18.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsHotVideoController: KPBaseViewController {

    var userID: String?

    var tableView: UITableView?

    fileprivate var hotVideoItems = [KPNewsHotItem]()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        
        KPNetworkTool.shareNetworkTool.loadNewsHotVideoData(last: userID) {
        
            (item) in
        
        }
        
        
        
    }

    fileprivate func setupUI() {
        
        navigationItem.title = "热门视频"
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.backgroundColor = KPTable()
        
        tableView.register(KPNewsDetailAuthorCell.self, forCellReuseIdentifier: KPNewsDetailAuthorCellIdentifier)
                
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
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
        
        return hotVideoItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPNewsLikersListCellIdentifier) as! KPNewsLikersListCell
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
}
