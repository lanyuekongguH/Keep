//
//  KPDietItem.swift
//  Keep
//
//  Created by Damon on 17/5/5.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDietItem: NSObject {

    var id: String?
    var name: String?
    var content: String?
    var recipes: Array<Any>?
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        id = dict["id"] as? String
        name = dict["name"] as? String
        content = dict["content"] as? String
        recipes = dict["recipes"] as? Array
        
        
    }
    
}



