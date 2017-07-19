//
//  KPTrainRunManager.swift
//  Keep
//
//  Created by Damon on 2017/7/19.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
//import MAMapKit

protocol KPRunDataDelegate: NSObjectProtocol {
    func discoveryTabView(_ tabView:KPDiscoveryTabView, button:UIButton)
}



class KPTrainRunManager: NSObject {

    static let shareRunManager = KPTrainRunManager()
    
    private override init() {}
    
}
