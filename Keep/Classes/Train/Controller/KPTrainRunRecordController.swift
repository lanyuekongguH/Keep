//
//  KPTrainRunRecordController.swift
//  Keep
//
//  Created by Damon on 17/3/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTrainRunRecordController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "back"), style: .plain, target: self, action: #selector(backClick))

    }
    
    func backClick() {
    
        dismiss(animated: true, completion: nil)
    }
}
