//
//  KPPublishViewController.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPPublishViewController: KPBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        navigationItem.title = "新动态"

        
        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "closebtn"), style: .plain, target: self, action: #selector(cancleClick))

        navigationItem.leftBarButtonItem = UIBarButtonItem.init(image: UIImage(named: "closebtn"), style: .plain, target: self, action: #selector(cancleClick))

    }
    
    func cancleClick(){
    
        dismiss(animated: true, completion: nil)

    }

}
