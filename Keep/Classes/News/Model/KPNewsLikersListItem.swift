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
    var users: Array<KPNewsLikersItem>?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        lastId = dict["lastId"] as? String
        
        if let likerArray = dict["users"] as? [AnyObject] {
            
            var likersItem = [KPNewsLikersItem]()
            
            for item in likerArray {
                let item = KPNewsLikersItem(dict: item as! [String: AnyObject])
                likersItem.append(item)
            }
            
            users = likersItem
        }
    }
}
