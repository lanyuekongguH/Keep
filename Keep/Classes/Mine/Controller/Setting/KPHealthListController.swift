//
//  KPHealthListController.swift
//  Keep
//
//  Created by Damon on 17/4/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

let KPHealthListCellIdentifier = "KPHealthListCellIdentifier"

class KPHealthListController: KPBaseViewController {

    var tableView: UITableView?
    
    var dataArray = [KPHealthData]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        
        KPHealthTool.healthTool.getHealthKitStepCountData { (stepCounts) in
            
            self.dataArray = stepCounts

            self.tableView?.reloadData()
        }
    }
    
    fileprivate func setupUI() {
        
        navigationItem.title = "所有已记录的数据"
        view.backgroundColor = KPBg()
        
        let tableView = UITableView.init(frame: view.bounds, style: .plain)
        
        tableView.register(KPHealthListCell.self, forCellReuseIdentifier: KPHealthListCellIdentifier)
        
        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
}

extension KPHealthListController: UITableViewDelegate {
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: false)
    }
}

extension KPHealthListController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPHealthListCellIdentifier) as! KPHealthListCell
        
        cell.healthData = dataArray[indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 40
    }
    
}



