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

class KPNetworkTool: NSObject {

    static let shareNetworkTool = KPNetworkTool()
    
    /// 加载banner数据
    func loadStoreBannerData(_ finished:@escaping ([KPStoreBanner]) ->()) {
        
        //https://store.gotokeep.com/api/v1/banner/1
        
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
        
        //https://store.gotokeep.com/api/v1/banner/1
        
        
//        let url = "https://store.gotokeep.com/api/v1.0/subject/bannerList"
        
//        let url = "https://api.gotokeep.com/v1.1/log/client/web?"
        
//        let url = "https://m.analytics.126.net/news/c"
        
//        let params = ["format": "json",
//                      "userId": "57eb03de4933030ca9305423"] as [String : Any]
        

        Alamofire.request(url).responseJSON { response in
            
            print(response)
            
            guard response.result.isSuccess else {
                SVProgressHUD.showError(withStatus: "加载失败...")
                return
            }
            
            if let value = response.result.value {
                
                let json = JSON(value)
                
                print("dddddddddd",json)

//                request(json)
            }
        }
    
    }
    
    
    /// 加载商城数据

    
    
    
    
    
}
