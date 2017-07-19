//
//  KPTrainMapPathController.swift
//  Keep
//
//  Created by 舒明明 on 2017/6/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTrainMapPathController: UIViewController {

    fileprivate var map: MAMapView?

    override func viewDidLoad() {
        super.viewDidLoad()

        let map = MAMapView(frame:self.view.bounds)
        map.zoomLevel = 15
        map.isRotateEnabled = false
        map.delegate = self as! MAMapViewDelegate
        self.view.addSubview(map)
        self.map = map
        
    }
}
