//
//  KPStoreBanner.swift
//  Keep
//
//  Created by Damon on 17/3/14.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPStoreBanner: NSObject {

    var productId: String?
    var originPrice: Int?
    var specialOfferPrice: Int?
    var name: String?
    var message: String?
    var time: Int?
    var image: String?
    var url: String?
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        productId = dict["productId"] as? String
        originPrice = dict["originPrice"] as? Int
        specialOfferPrice = dict["specialOfferPrice"] as? Int
        name = dict["name"] as? String
        message = dict["message"] as? String
        time = dict["time"] as? Int
        image = dict["image"] as? String
        url = dict["url"] as? String
    }
    
    
    //    "productId": 126,
    //    "originPrice": 14900,
    //    "specialOfferPrice": 12900,
    //    "name": "Keep | 工字运动内衣 黑色＋白色",
    //    "message": "江疏影同款运动内衣",
    //    "time": 66544000,
    //    "image": "https://static2.keepcdn.com/ec/product/973/9f02639e4bc3546c8fe71dd955a12761.jpg",
    //    "url": "keep://store_item/126"
}
