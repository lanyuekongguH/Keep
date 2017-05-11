//
//  KPDiscoveryTrainItem.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryTrainItem: NSObject {

    var sectionName: String?
    var plans: Array<KPDiscoveryPlanItem>?
    var more: String?
    var subTitle: String?
    var workouts: Array<Any>?
    var hashTagId: String?
    var attendedPlan: Bool?
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        sectionName = dict["sectionName"] as? String
        
        if let plansArray = dict["plans"] as? [AnyObject] {
            
            var likersItem = [KPDiscoveryPlanItem]()
            
            for item in plansArray {
                let item = KPDiscoveryPlanItem(dict: item as! [String: AnyObject])
                likersItem.append(item)
            }
            
            plans = likersItem
        }
        
        more = dict["more"] as? String
        subTitle = dict["subTitle"] as? String
        workouts = dict["workouts"] as? Array
        hashTagId = dict["hashTagId"] as? String
        attendedPlan = dict["attendedPlan"] as? Bool
    }
    
}

