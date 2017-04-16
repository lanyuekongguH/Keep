//
//  KPNewsLikeListController.swift
//  Keep
//
//  Created by Damon on 17/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

let KPNewsLikersListCellIdentifier = "KPNewsLikersListCellIdentifier"

class KPNewsLikeListController: KPBaseViewController {

    var userID: String?

    var tableView: UITableView?

    var likers: KPNewsLikersListItem?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()

        KPNetworkTool.shareNetworkTool.loadNewsHotLikesData(userID: userID) { [weak self] data in
        
            self?.likers = data
            
            self?.tableView?.reloadData()
        }
    }
    
    fileprivate func setupUI() {
        
        navigationItem.title = "加油"
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        tableView.backgroundColor = KPTable()
        
        tableView.register(KPNewsDetailAuthorCell.self, forCellReuseIdentifier: KPNewsDetailAuthorCellIdentifier)
        
        let likersListNib = UINib.init(nibName: "KPNewsLikersListCell", bundle: nil)
        tableView.register(likersListNib, forCellReuseIdentifier: KPNewsLikersListCellIdentifier)
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
    }
}

extension KPNewsLikeListController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
        
        if indexPath.section == 1 {
            
        }
    }
}

extension KPNewsLikeListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let users = likers?.users {
        
            return users.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPNewsLikersListCellIdentifier) as! KPNewsLikersListCell
        
        cell.likersItem = likers?.users?[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50
    }
    
}



