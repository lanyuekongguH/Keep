//
//  KPNewsHotItem.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import SwiftyJSON

class KPNewsHotItem: NSObject {

    var reason: String?
    var achievements: Array<Any>?
    var internalShareCount: Int?
    var stateValue: String?
    var feel: String?
    var type: String?
    var content: String?
    var geo: Array<Any>?
    
    var myPublic: Bool?
    var noise: Bool?
    var originalMd5: String?
    var sampleComments: String?
    var state: String?
    var viewCount: Int?
    var id: String?
    var contentType: Array<Any>?
    
    var likes: Int?
    var comments: String?
    var author: KPNewsAuthorItem?
    
    var created: String?
    var hasLiked: Bool?
    var photo: String?
    var commentUsers: String?
    var externalShareCount: String?
    var favoriteCount: Int?
    
    
    init(dict: [String: AnyObject]) {
        
        super.init()
        
        reason = dict["reason"] as? String
        achievements = dict["achievements"] as? Array
        internalShareCount = dict["internalShareCount"] as? Int
        stateValue = dict["stateValue"] as? String
        feel = dict["feel"] as? String
        type = dict["type"] as? String
        content = dict["content"] as? String
        geo = dict["geo"] as? Array
        myPublic = dict["public"] as? Bool
        noise = dict["noise"] as? Bool
        originalMd5 = dict["originalMd5"] as? String
        sampleComments = dict["sampleComments"] as? String
        state = dict["state"] as? String
        viewCount = dict["viewCount"] as? Int
        id = dict["id"] as? String
        contentType = dict["contentType"] as? Array
        likes = dict["likes"] as? Int
        comments = dict["comments"] as? String
        author = KPNewsAuthorItem(dict: dict["author"] as! [String: AnyObject])
        created = dict["created"] as? String
        hasLiked = dict["hasLiked"] as? Bool
        photo = dict["photo"] as? String
        commentUsers = dict["id"] as? String
        externalShareCount = dict["contentType"] as? String
        favoriteCount = dict["favoriteCount"] as? Int
    }
    
//    "reason": "grouped",
//    "achievements": [],
//    "internalShareCount": 0,
//    "stateValue": 20,
//    "feel": 0,
//    "type": "direct",
//    "content": "健身一点都不耽误事\uD83D\uDE2DSCI又被拒稿了，The manuscript is well prepared and the work done is appreciated. However, the subject is too specialized for this journal which publishes mainly manuscripts dealing with nutrition physiology. Therefore, I would strongly encourage you to submit this manuscript to a journal dealing with lactation physiology.疯了…都修改过一次了，熬夜熬夜熬夜……",
//    "geo": [],
//    "public": true,
//    "noise": false,
//    "originalMd5": "34f60d3e1a0ccdff3be0973cb9f7d970,b424a417f1bfd2b8cc5850d577b9c561",
//    "sampleComments": null,
//    "state": "normal",
//    "viewCount": 47875,
//    "id": "58da927be1d6d43e58a6480a",
//    "contentType": ["photo", "text"],
//    "likes": 1512,
//    "comments": 395,
//    "author": {
//    "gender": "F",
//    "_id": "5852069c31f11654088d0c75",
//    "avatar": "http://static1.keepcdn.com/avatar/2016/12/20/16/28ddbdcf59637831e66eec02d25213186a268d25.jpg",
//    "username": "不似旧日"
//    },
//    "created": "2017-03-28T16:42:35.000Z",
//    "hasLiked": false,
//    "photo": "http://static1.keepcdn.com/picture/2017/03/29/00/fd61a64510c261625afcac5eea8b517ba2db07c5_1015x1800.jpg",
//    "meta": {},
//    "commentUsers": 0,
//    "_id": "58da927be1d6d43e58a6480a",
//    "externalShareCount": 4,
//    "favoriteCount": 51
}
