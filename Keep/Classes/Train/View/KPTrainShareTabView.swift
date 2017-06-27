//
//  KPTrainShareTabView.swift
//  Keep
//
//  Created by 舒明明 on 2017/6/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

public enum UITableViewCellEditingStyle : Int {
    
    case street
    
    case path
    
    case map
    
    case consume
    
    case speed
    
    case data
}

protocol TrainShareTabDelegate: NSObjectProtocol {
    func trainShareTabDelegate(_ view:KPTrainShareTabView, button:UIButton)
}

class KPTrainShareTabView: UIScrollView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
    }

    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
