//
//  KPMineController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

let KPMineListCellIdentifier = "KPMineListCellIdentifier"
let KPMineTabButtonCellIdentifier = "KPMineTabButtonCellIdentifier"


class KPMineController: UIViewController {

    var tableView: UITableView?
    
    var dataArray = [[String]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        loadData()
        
        setupUI()
        
    }
    
    fileprivate func loadData() {
        dataArray = [["训练等级","跑步等级","骑行等级","我的徽章","我的活动"],["购物车","我的订单","优惠券"]]
        
        print(dataArray)
    }
    
    fileprivate func setupUI() {
    
        navigationItem.title = "我"
        view.backgroundColor = KPBg()
        
        let rightItem = UIBarButtonItem(image: UIImage(named: "personal_message_center_icon"), style: .plain, target: self, action: #selector(rightItemClick))
        
        let leftItem = UIBarButtonItem(image: UIImage(named: "install"), style: .plain, target: self, action: #selector(leftItemClick))
        
        navigationItem.leftBarButtonItem = leftItem
        navigationItem.rightBarButtonItem = rightItem
        
        let tableView = UITableView.init(frame: view.bounds, style: .grouped)
        let noLoginNib = UINib.init(nibName: "KPMineListCell", bundle: nil)
        tableView.register(noLoginNib, forCellReuseIdentifier: KPMineListCellIdentifier)
        
        tableView.register(KPMineTabButtonCell.self, forCellReuseIdentifier: KPMineTabButtonCellIdentifier)

        tableView.tableFooterView = UIView()
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        self.tableView = tableView
    }
    
    
    func rightItemClick() {
        let infoVc = KPInfoViewController()
        navigationController?.pushViewController(infoVc, animated: true)
    }
    
    func leftItemClick() {
        let settingVc = KPSettingController()
        navigationController?.pushViewController(settingVc, animated: true)
    }
    
    
    
}

extension KPMineController: UITableViewDelegate {

    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    }

}

extension KPMineController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return dataArray[0].count
        } else {
            return dataArray[1].count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        var cell = UITableViewCell()
        
        if indexPath.section == 1 {
            cell = tableView.dequeueReusableCell(withIdentifier: KPMineTabButtonCellIdentifier) as! KPMineTabButtonCell
            var tabButtonCell = KPMineTabButtonCell()
            tabButtonCell = cell as! KPMineTabButtonCell
            tabButtonCell.delegate = self
            
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: KPMineListCellIdentifier) as! KPMineListCell

            var mineListCell = KPMineListCell()
            mineListCell = cell as! KPMineListCell;
            
            if indexPath.section == 2 {
                
                mineListCell.nameLabel.text = dataArray[0][indexPath.row]
            } else if indexPath.section == 3 {
                mineListCell.nameLabel.text = dataArray[1][indexPath.row]
            }
            return mineListCell
        }
        
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
    
        return 4
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 || indexPath.section == 3 {
            return 44
        } else {
            return 90
        }
    }
  
}

extension KPMineController: KPMineTabButtonCellDelegate {

    func tabButtonmCell(_ bottom:KPMineTabButtonCell, button:UIButton) {
    
        switch (button.tag) {
        case 1:
            let historyVc = KPMineHistoryController()
            navigationController?.pushViewController(historyVc, animated: true)
        case 2:
            let collectionVc = KPMineCollectionController()
            navigationController?.pushViewController(collectionVc, animated: true)
        case 3:
            let collectionVc = KPMineDataViewController()
            navigationController?.pushViewController(collectionVc, animated: true)
        case 4:
            let sportsVc = KPMineSportsController()
            navigationController?.pushViewController(sportsVc, animated: true)
        default: break
        }
    }
        
}

