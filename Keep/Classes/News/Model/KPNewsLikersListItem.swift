//
//  KPNewsLikersListItem.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsLikersListItem: NSObject {

    var lastId: String?
    var users: Array<Any>?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        lastId = dict["lastId"] as? String
        users = dict["users"] as? Array
    }
}
