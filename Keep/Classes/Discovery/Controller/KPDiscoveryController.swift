//
//  KPDiscoveryController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryController: KPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.titleView = searchBar

    }

    
    fileprivate lazy var searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.frame = CGRect(x: 0, y: 0, width: SCREENW - 40, height: 30)
        searchBar.placeholder = "查找课程、用户、话题和商品"
        return searchBar
    }()
    
}
