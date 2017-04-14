//
//  KPHotDetailItem.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPHotDetailItem: NSObject {

    var country: String?
    var commentsList: Array<Any>?
    var achievements: Array<Any>?
    var city: String?
    var internalShareCount: Array<Any>?
    var stateValue: String?
    
    var feel: String?
    var type: String?

    var content: String?
    var relation: String?
    var geo: Array<Any>?
    var myPublic: Bool?
    var hasFavorited: Bool?
    var noise: Bool?
    
    var originalMd5: String?
    var state: String?
    var viewCount: String?
    var id: String?
    var contentType: Array<Any>?
    var likers: Array<KPNewsLikersItem>?
    var likes: String?
    var comments: String?

    var author: KPNewsAuthorItem?
    var created: String?
    var hasLiked: Bool?
    var photo: String?
    var commentUsers: String?

    var _id: String?

    var externalShareCount: String?
    var favoriteCount: String?
    var now: String?

    init(dict: [String: AnyObject]) {
        
        super.init()
        
        country = dict["country"] as? String
        
        commentsList = dict["commentsList"] as? Array
        achievements = dict["achievements"] as? Array
        city = dict["city"] as? String
        internalShareCount = dict["internalShareCount"] as? Array
        stateValue = dict["stateValue"] as? String
        feel = dict["feel"] as? String
        type = dict["type"] as? String

        content = dict["content"] as? String
        
        relation = dict["relation"] as? String
        geo = dict["geo"] as? Array
        feel = dict["feel"] as? String
        type = dict["type"] as? String
        
        myPublic = dict["public"] as? Bool
        hasFavorited = dict["stateValue"] as? Bool
        noise = dict["noise"] as? Bool

        originalMd5 = dict["originalMd5"] as? String
        state = dict["state"] as? String
        viewCount = dict["viewCount"] as? String
        id = dict["id"] as? String
        contentType = dict["contentType"] as? Array
        comments = dict["comments"] as? String
        
        if let likerArray = dict["likers"] as? [AnyObject] {
            
            var likersItem = [KPNewsLikersItem]()

            for item in likerArray {
                let item = KPNewsLikersItem(dict: item as! [String: AnyObject])
                likersItem.append(item)
            }
            
            likers = likersItem
        }
        
        if let data = dict["author"] {
            
            author = KPNewsAuthorItem(dict: data as! [String: AnyObject])
        }

        created = dict["created"] as? String
        hasLiked = dict["hasLiked"] as? Bool
        photo = dict["photo"] as? String
        commentUsers = dict["commentUsers"] as? String
        _id = dict["_id"] as? String
        
        externalShareCount = dict["externalShareCount"] as? String
        favoriteCount = dict["favoriteCount"] as? String
        
        now = dict["now"] as? String

    }
}
