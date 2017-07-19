//
//  KPTrainRunManager.swift
//  Keep
//
//  Created by Damon on 2017/7/19.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

protocol KPRunDataDelegate: NSObjectProtocol {
    func discoveryTabView(_ tabView:KPDiscoveryTabView, button:UIButton)
}

class KPTrainRunManager: NSObject {

    static let shareRunManager = KPTrainRunManager()
    
    private override init() {}
    
    /**开始跑步*/
    public func beginRun() {
    
    }
    
    /**重新进入APP继续跑步 需要调用次方法先暂停*/
    public func rePauseRun() {
        
    }
    
    /**暂停跑步*/
    public func pauseRun() {
        
    }
    
    /**重新开始跑步*/
    public func rebeginRun() {
        
    }
    
    /**结束跑步*/
    public func endRun() {
        
    }
    
    public func releaseManager() {
        
    }
    
}

extension KPTrainRunManager: MAMapViewDelegate {

    func mapView(_ mapView: MAMapView!, didUpdate userLocation: MAUserLocation!, updatingLocation: Bool) {
        
    }
    
    func mapViewWillStartLocatingUser(_ mapView: MAMapView!) {
        
        print("定位开始")
    }
    
    func mapViewDidStopLocatingUser(_ mapView: MAMapView!) {
        
        print("定位结束")
    }
    
    func mapViewDidFailLoadingMap(_ mapView: MAMapView!, withError error: Error!) {
        
        print("定位失败")
    }
}
