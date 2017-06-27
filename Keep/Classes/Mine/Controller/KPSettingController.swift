//
//  KPSettingController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit


let KPMineSettingCellIdentifier = "KPMineSettingCellIdentifier"


class KPSettingController: UIViewController {

    var dataArray = [[String]]()
    var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadDataArray()
        
        setupUI()
    }
    
    func setupUI() {
        
        view.backgroundColor = UIColor.white
        
        
        DispatchQueue.global().async {
            
            let tableView = UITableView.init(frame: self.view.bounds, style: .grouped)
            
            tableView.register(KPMineSettingCell.self, forCellReuseIdentifier: KPMineSettingCellIdentifier)
            
            tableView.tableFooterView = UIView()
            tableView.delegate = self
            tableView.dataSource = self
            self.view.addSubview(tableView)
            self.tableView = tableView
        }
        
            
        
    }

    func loadDataArray() {
    
        dataArray = [["个人资料","账号管理","账号绑定","隐私设置","连接健康"],["健身目标","健身基础","训练设置","离线地图"],["消息推送","缓存管理","扫一扫"],["关于","社区规范","社区公约","网络诊断","邀请好友","去App Store评分","帮助与反馈"]]
    }

}


extension KPSettingController: UITableViewDelegate {


}

extension KPSettingController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArray[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: KPMineSettingCellIdentifier) as! KPMineSettingCell
        
        cell.textLabel?.text = dataArray[indexPath.section][indexPath.row]
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 44
    }
    
}



