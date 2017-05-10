//
//  KPDiscoveryBannerItem.swift
//  Keep
//
//  Created by Damon on 17/5/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryBannerItem: NSObject {

    var _id: String?
    var url: String?
    var photo: String?
    var ipadPhoto: String?
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        _id = dict["_id"] as? String
        url = dict["url"] as? String
        photo = dict["photo"] as? String
        ipadPhoto = dict["ipadPhoto"] as? String
    } 
}


//"_id": 862,
//"url": "keep://articles/59100d5435c9ae068a9e5bf2",
//"photo": "http://static1.keepcdn.com/2017/05/10/13/1494395798852_750x400.jpg",
//"ipadPhoto": "http://static1.keepcdn.com/2017/05/10/13/1494395796805_1500x600.jpg"
