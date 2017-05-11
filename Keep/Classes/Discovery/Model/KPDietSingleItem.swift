//
//  KPDietSingleItem.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDietSingleItem: NSObject {

    var id: String?
    var name: String?
    var cover: String?
    var duration: Int?
    var state: Int?
    var calorie: Int?

    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        id = dict["id"] as? String
        name = dict["name"] as? String
        cover = dict["cover"] as? String
        duration = dict["duration"] as? Int
        state = dict["state"] as? Int
        calorie = dict["calorie"] as? Int
    }
    
}

