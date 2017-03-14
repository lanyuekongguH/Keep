//
//  KPTrainViewController.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import SwiftyJSON

class KPTrainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.titleView = titleView

        let rightItem = UIBarButtonItem(image: UIImage(named: "icon_run_sign"), style: .plain, target: self, action: #selector(rightItemClick))
        navigationItem.rightBarButtonItem = rightItem
        
    }
    
    func rightItemClick() {
        let runRecordVc = KPTrainRunRecordController()
        let nav = KPNavigationController.init(rootViewController: runRecordVc)
        self.present(nav, animated: true, completion:
        nil)
    }
    
    fileprivate lazy var titleView: UIImageView = {
        let titleView = UIImageView()
        titleView.image = UIImage(named: "sticker_keep")
        titleView.frame = CGRect(x: 0, y: 0, width: 41, height: 20)
        return titleView
    }()
    
    

}
