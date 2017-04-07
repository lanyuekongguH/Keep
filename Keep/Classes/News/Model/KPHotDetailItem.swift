//
//  KPHotDetailItem.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPHotDetailItem: NSObject {

    var commentsList: Array<Any>?
    var achievements: Array<Any>?
    var internalShareCount: String?
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
    
    
    init(dict: [String: AnyObject]) {
        super.init()
        
        commentsList = dict["commentsList"] as? Array
        achievements = dict["achievements"] as? Array
        internalShareCount = dict["internalShareCount"] as? String
        stateValue = dict["stateValue"] as? String
        feel = dict["feel"] as? String
        type = dict["type"] as? String
        
        content = dict["content"] as? String
        relation = dict["relation"] as? String
        geo = dict["geo"] as? Array
        stateValue = dict["stateValue"] as? String
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
        likers = dict["likers"] as? Array
        likes = dict["likes"] as? String
        comments = dict["comments"] as? String
        
        author = dict["author"] as? KPNewsAuthorItem
        created = dict["created"] as? String
        hasLiked = dict["hasLiked"] as? Bool
        photo = dict["photo"] as? String
        commentUsers = dict["commentUsers"] as? String
        _id = dict["_id"] as? String
        
        externalShareCount = dict["externalShareCount"] as? String
        favoriteCount = dict["favoriteCount"] as? String
    }
}
