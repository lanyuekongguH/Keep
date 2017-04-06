//
//  KPStoreBannerCell.swift
//  Keep
//
//  Created by Damon on 17/3/14.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPStoreBannerCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
    
        addSubview(scrollView)
    }
    
    var banners: [KPStoreBanner]! {
        didSet {
            scrollView.contentSize = CGSize.init(width: (CGFloat(banners.count) * SCREENW), height: 150)
            scrollView.isPagingEnabled = true
            scrollView.alwaysBounceHorizontal = true
            scrollView.showsHorizontalScrollIndicator = false

            for index in 0...(banners.count-1) {

                let contentBanner = KPStoreBannerView()
                contentBanner.banner = banners[index]
                contentBanner.frame = CGRect.init(x: CGFloat(index) * SCREENW, y: 0, width: SCREENW, height: 150)
                scrollView.addSubview(contentBanner)
            }
        }
    }
    
    fileprivate lazy var scrollView: UIScrollView = {
    
        let scrollView = UIScrollView()
        scrollView.frame = CGRect.init(x: 0, y: 20, width: SCREENW, height: 150)
        scrollView.backgroundColor = UIColor.white
        return scrollView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
