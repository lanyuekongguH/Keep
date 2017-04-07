//
//  KPNewsAuthorItem.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsAuthorItem: NSObject {
    
    var gender: String?
    var _id: String?
    var avatar: String?
    var username: String?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        gender = dict["gender"] as? String
        _id = dict["_id"] as? String
        avatar = dict["avatar"] as? String
        username = dict["username"] as? String
    }
    
}
