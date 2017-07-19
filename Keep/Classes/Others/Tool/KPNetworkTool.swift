//
//  KPNetworkTool.swift
//  Keep
//
//  Created by Damon on 17/3/13.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import Alamofire
import SVProgressHUD
import SwiftyJSON
import SDWebImage

class KPNetworkTool: NSObject {

    static let shareNetworkTool = KPNetworkTool()
    
    private override init() {}
    
    /// 加载banner数据
    func loadStoreBannerData(_ finished:@escaping ([KPStoreBanner]) ->()) {
        
        let path = Bundle.main.path(forResource: "BannerData", ofType: "geojson")
        let contentData = NSData.init(contentsOfFile: path!)
        let json = JSON(contentData as Any)
        
        if let data = json["data"].arrayObject {
            var bannerArray = [KPStoreBanner]()
            
            for dict in data {
                let title = KPStoreBanner(dict: dict as! [String: AnyObject])
                bannerArray.append(title)
            }
            
            finished(bannerArray)
            print(bannerArray)

        }
    }
    
    /// 加载商城数据
    func loadStoreListData(_ request:@escaping ([Any]) ->()) {
    
        let url = "https://store.gotokeep.com/api/v1.0/subject/recommondAreaList?count=7"

        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
        }
    }
    
    
    /// 加载商城数据

    /// 加载热门数据
    func loadNewsHotData(last lastId:String?, _ finished:@escaping ([KPNewsHotItem],String?) ->()) {

        var url: String
        
        if let lastId = lastId {
            url = "https://api.gotokeep.com/social/v3/timeline/hot?lastId=\(lastId)"

        } else {
            url = "https://api.gotokeep.com/social/v3/timeline/hot"
        }
        
        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"]["entries"].arrayObject {
                    var hotItems = [KPNewsHotItem]()
                    
                    for dict in data {
                        let item = KPNewsHotItem(dict: dict as! [String: AnyObject])
                        hotItems.append(item)
                    }
                    
                    let lastID = json["data"]["lastId"].string
                    
                    finished(hotItems, lastID)
                }
            }
        }
    }

    /// 加载热门详情数据
    func loadNewsHotDetailData(userID userId:String?, _ finished:@escaping (KPHotDetailItem?) ->()) {

        let url = "https://api.gotokeep.com/v1.1/entries/\(userId!)?limit=20&reverse=true"
        
        Alamofire.request(url).responseJSON { response in
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                
                if let dic = json["data"].dictionaryObject {
                    
                    var data = dic
                    
                    data["now"] = json["now"].string
                    
                    let item = KPHotDetailItem(dict: data as [String: AnyObject])
                    
                    finished(item)
                }
            }
        }
    }
    
    /// 加载评论列表数据
    func loadNewsHotCommentsData(userID userId:String?, _ finished:@escaping ([KPNewsCommentsItem]?) ->()) {

        let url = "https://api.gotokeep.com/v1.1/entries/\(userId!)/comments?limit=20&reverse=true"
        
        Alamofire.request(url).responseJSON { response in
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"].arrayObject {

                    var comments = [KPNewsCommentsItem]()
                    
                    for comment in data {
                        
                        let item = KPNewsCommentsItem(dict: comment as! [String: AnyObject])
                        comments.append(item)
                    }
                    
                    finished(comments)
                }
            }
        }
    }

    /// 加载喜欢的人列表数据
    func loadNewsHotLikesData(userID userId:String?, _ finished:@escaping (KPNewsLikersListItem?) ->()) {

        let url = "https://api.gotokeep.com/v1.1/entries/\(userId!)/likes"
        
        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"].dictionaryObject {
                    
                    let item = KPNewsLikersListItem(dict: data as [String: AnyObject])
                    finished(item)
                }
            }
        }
    }
    
    func loadWebpData(urlStr url:String?, _ finished:@escaping (Data?) ->()) {
        
        let url = "http://static1.keepcdn.com/picture/2017/04/16/20/9f0acd7751def8c752ec3e73915964eba2777620_2000x1500.jpg?imageMogr2/thumbnail/720x720/format/webp/quality/90"
        
        Alamofire.download(url).responseData { (response) in
            
            if let data = response.result.value {
                
                finished(data)
            }
        }
    }

    func loadNewsHotVideoData(last lastId:String?, _ finished:@escaping ([KPHotDetailItem],String?) ->()) {

        var url: String
        
        if let lastId = lastId {
            url = "https://api.gotokeep.com/social/v2/video/timeline/hot?lastId=\(lastId)&limit=20"
            
        } else {
            url = "https://api.gotokeep.com/social/v2/video/timeline/hot?limit=20"
        }
        
        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"].arrayObject {
                    var hotItems = [KPHotDetailItem]()
                    
                    for dict in data {
                        let item = KPHotDetailItem(dict: dict as! [String: AnyObject])
                        hotItems.append(item)
                    }
                    
                    let lastID = json["lastId"].string
                    
                    finished(hotItems,lastID)
                }
            }
        }
    }
    
    
    func loadNewsFollowListData(last lastId:String?, _ finished:@escaping ([KPHotDetailItem],String?) ->()) {
        
        // https://api.gotokeep.com/social/v2/follow/timeline
        
        var url: String
        
        if let lastId = lastId {
            url = "https://api.gotokeep.com/social/v3/timeline/hot?lastId=\(lastId)"
            
        } else {
            url = "https://api.gotokeep.com/social/v2/follow/timeline"
            
        }
        
        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"]["timeline"].arrayObject {
                    var followItems = [KPHotDetailItem]()
                    
                    for dict in data {
                        let item = KPHotDetailItem(dict: dict as! [String: AnyObject])
                        followItems.append(item)
                    }
                    
                    let lastID = json["data"]["lastId"].string
                    
                    finished(followItems, lastID)
                }
            }
        }
    }
    
    
    func loadTrainListData(_ finished:@escaping ([KPDiscoveryTrainItem]) ->()) {

        let path = Bundle.main.path(forResource: "TrainListData", ofType: "geojson")
        let contentData = NSData.init(contentsOfFile: path!)
        let json = JSON(contentData as Any)
        
        if let data = json["data"]["courses"].arrayObject {
            var bannerArray = [KPDiscoveryTrainItem]()
            
            for dict in data {
                let title = KPDiscoveryTrainItem(dict: dict as! [String: AnyObject])
                bannerArray.append(title)
            }
            
            finished(bannerArray)
            print(bannerArray)
        }
    }
    
    func loadDietListData(_ finished:@escaping ([KPDietItem]) ->()) {
        
        let path = Bundle.main.path(forResource: "DietListData", ofType: "geojson")
        let contentData = NSData.init(contentsOfFile: path!)
        let json = JSON(contentData as Any)
        
        if let data = json["data"]["content"]["recipeTags"].arrayObject {
            var bannerArray = [KPDietItem]()
            
            for dict in data {
                let title = KPDietItem(dict: dict as! [String: AnyObject])
                bannerArray.append(title)
            }
            
            finished(bannerArray)
            print(bannerArray)
        }
    }
    
    func loadAdsBannerData(url:String?, _ finished:@escaping ([KPDiscoveryBannerItem]) ->()) {
        
        //训练
        //https://api.gotokeep.com/v1.1/ads/banner?type=2

        //饮食
        //https://api.gotokeep.com/v1.1/ads/banner?type=4
        
        //商城
        //https://store.gotokeep.com/api/v1.0/subject/bannerList
        //运动装备
        //https://store.gotokeep.com/api/v2/vcategory?cid=0
        //消息
        //https://store.gotokeep.com/api/v1.0/subject/noticeList
        
        
        Alamofire.request(url!).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                if let data = json["data"].arrayObject {

                    var items = [KPDiscoveryBannerItem]()
                    
                    for dict in data {
                        let item = KPDiscoveryBannerItem(dict: dict as! [String: AnyObject])
                        items.append(item)
                    }
                    
                    finished(items)
                }
            }
        }
    }
}
