//
//  KPDiscoveryPlanItem.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryPlanItem: NSObject {

    var id: String?
    var title: String?
    var pioneer: Int?
    var difficulty: Int?
    
    var picture: String?
    var count: String?
    var trainingpoints: Array<Any>?
    var equipments: Array<Any>?
    
    var reason: String?
    var source: String?
    var averageDuration: Int?
    var tags: Array<Any>?
    var outdoor: Bool?

    init(dict: [String: AnyObject]) {
        
        super.init()
        
        id = dict["id"] as? String
        title = dict["title"] as? String
        pioneer = dict["pioneer"] as? Int
        difficulty = dict["difficulty"] as? Int
        
        picture = dict["picture"] as? String
        count = dict["count"] as? String
        trainingpoints = dict["trainingpoints"] as? Array
        equipments = dict["equipments"] as? Array
        
        reason = dict["reason"] as? String
        source = dict["source"] as? String
        averageDuration = dict["averageDuration"] as? Int
        tags = dict["tags"] as? Array
        outdoor = dict["outdoor"] as? Bool
    }
}
