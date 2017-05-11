//
//  KPDiscoveryHeadCell.swift
//  Keep
//
//  Created by Damon on 17/5/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryHeadCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(timerScrollView)
    }

    var tabTitles: [String]? {
        didSet {
            
            if let tabTitles = tabTitles {
                
                let size = tabTitles[0].getImageViewSize()
                timerScrollView.frame = CGRect.init(x: 0, y: 0, width: SCREENW, height: size.height)
            }
            
        }
    }
    
    fileprivate lazy var timerScrollView: KPTimerScrollView = {
        
        let timerScrollView = KPTimerScrollView()
        return timerScrollView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
