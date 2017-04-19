//
//  KPNewsCommentsItem.swift
//  Keep
//
//  Created by Damon on 17/4/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsCommentsItem: NSObject {

    var refe_type: String?
    var author: KPNewsAuthorItem?
    var created: String?
    var refe: String?
    var hasLiked: Bool?
    var stateValue: Int?
    var id: String?
    var _id: String?
    var state: String?
    var content: String?
    var likes: Int?
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        refe_type = dict["refe_type"] as? String
        
        if let authorItem = dict["author"] {
            
            author = KPNewsAuthorItem(dict: authorItem as! [String: AnyObject])
        }
        
        created = dict["created"] as? String
        refe = dict["refe"] as? String
        
        hasLiked = dict["hasLiked"] as? Bool
        stateValue = dict["stateValue"] as? Int
        id = dict["id"] as? String
        _id = dict["_id"] as? String
        state = dict["state"] as? String
        content = dict["content"] as? String
        likes = dict["likes"] as? Int
        
    }
    
    
//    "refe_type": "entry",
//    "author": {
//    "gender": "F",
//    "_id": "54db450e919f9f86495a919c",
//    "avatar": "http://static1.keepcdn.com/avatar/2017/03/31/16/ed4950036047b04fda2f71d6d685bfa2a443f246.jpg",
//    "username": "小華"
//    },
//    "created": "2017-04-13T09:41:15.000Z",
//    "refe": "58eedb6df75d3926e2fce3d2",
//    "hasLiked": false,
//    "stateValue": 20,
//    "id": "58ef47bb04e15628d3e78e64",
//    "_id": "58ef47bb04e15628d3e78e64",
//    "state": "normal",
//    "content": "哪个牛奶可以送keep的瑜伽垫😂",
//    "likes": 0
    
}
