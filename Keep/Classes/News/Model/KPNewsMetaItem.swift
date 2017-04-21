//
//  KPNewsMetaItem.swift
//  Keep
//
//  Created by Damon on 17/4/21.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsMetaItem: NSObject {

    var schema: String?
    var eventId: String?
    var workoutName: String?
    var count: Int?

    var icon: String?
    var finished: Bool?
    var title: String?
    var darkIcon: String?
    
    var duration: Int?
    var secondDuration: Int?
    var subtype: String?
    var name: String?
    
    var device: String?
    var order: Int?
  
    init(dict: [String: AnyObject]) {
        super.init()
        
        schema = dict["schema"] as? String
        eventId = dict["eventId"] as? String
        workoutName = dict["workoutName"] as? String
        count = dict["count"] as? Int
        
        icon = dict["icon"] as? String
        finished = dict["finished"] as? Bool
        title = dict["title"] as? String
        darkIcon = dict["darkIcon"] as? String
        
        duration = dict["duration"] as? Int
        secondDuration = dict["secondDuration"] as? Int
        subtype = dict["subtype"] as? String
        name = dict["name"] as? String
        
        device = dict["device"] as? String
        order = dict["order"] as? Int
    }
}



