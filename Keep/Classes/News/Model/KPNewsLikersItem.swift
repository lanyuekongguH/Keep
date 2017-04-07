//
//  KPNewsLikersItem.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsLikersItem: NSObject {

    var avatar: String?
    var bio: String?
    var username: String?
    var created: String?
    var _id: String?

    init(dict: [String: AnyObject]) {
        super.init()
        
        avatar = dict["avatar"] as? String
        bio = dict["bio"] as? String
        username = dict["username"] as? String
        created = dict["created"] as? String
        _id = dict["_id"] as? String
    }
    
//    "avatar": "http://static1.keepcdn.com/avatar/2017/04/02/22/2969823f3423a3053e546a762502a439d323ee2f.jpg",
//    "bio": "",
//    "username": "y332821624",
//    "created": "2017-04-02T14:32:41.000Z",
//    "_id": "58e10b894933035eb8fa176f"
}
