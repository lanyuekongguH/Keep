//
//  KPStoreBannerView.swift
//  Keep
//
//  Created by Damon on 17/3/14.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import Kingfisher

class KPStoreBannerView: UIView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    var banner: KPStoreBanner? {
        didSet {
            
            if let banner = banner {
            
                titleLabel.text = banner.name
                
                detailLabel.text = banner.message
                
                if let specialOfferPrice = banner.specialOfferPrice, let originPrice = banner.originPrice {
                
                    specialOfferPriceLabel.text = "¥\(specialOfferPrice / 100)"
                    originPriceLabel.text = "¥\(originPrice / 100)"
                }
                
                timeLabel.text = "¥\(banner.time)"
                
                storeImageView.kf.setImage(with: URL(string: banner.image!))
                
                titleLabel.snp.makeConstraints { (make) in
                    make.height.equalTo(20)
                    make.width.equalTo(SCREENW - 20 - 150 - 20 - 20)
                    make.top.equalTo(20)
                    make.left.equalTo(30)
                }
                
                detailLabel.snp.makeConstraints { (make) in
                    make.height.equalTo(20)
                    make.width.equalTo(SCREENW - 20 - 150 - 20 - 20)
                    make.top.equalTo(titleLabel.snp.bottom).offset(5)
                    make.left.equalTo(30)
                }
                
                specialOfferPriceLabel.snp.makeConstraints { (make) in
                    
                    if let text = specialOfferPriceLabel.text {
                    
                        let size = text.boundingRectWithFont(specialOfferPriceLabel.font)
                        make.height.equalTo(size.height)
                        make.width.equalTo(size.width)
                        make.top.equalTo(detailLabel.snp.bottom).offset(20)
                        make.left.equalTo(30)
                    }
                }
                
                originPriceLabel.snp.makeConstraints { (make) in
                    
                    if let text = originPriceLabel.text {
                    
                        let size = text.boundingRectWithFont(originPriceLabel.font)
                        make.height.equalTo(size.height)
                        make.width.equalTo(size.width)
                        make.bottom.equalTo(specialOfferPriceLabel).offset(-2)
                        make.left.equalTo(specialOfferPriceLabel.snp.right).offset(15)
                    }
                }
                
                timeLabel.snp.makeConstraints { (make) in
                    
                    if let text = timeLabel.text {
                    
                        let size = text.boundingRectWithFont(timeLabel.font)
                        make.height.equalTo(size.height)
                        make.width.equalTo(size.width)
                    make.top.equalTo(specialOfferPriceLabel.snp.bottom).offset(15)
                        make.left.equalTo(30)
                    }
                }
                
                storeImageView.snp.makeConstraints { (make) in
                    make.width.height.equalTo(150)
                    make.top.equalTo(0)
                    make.right.equalTo(self.snp.right).offset(-20)
                }
            }
        }
    }
    
    fileprivate func setupUI() {
    
        addSubview(titleLabel)
        
        addSubview(detailLabel)
        
        addSubview(specialOfferPriceLabel)
        
        addSubview(originPriceLabel)
        
        addSubview(timeLabel)
        
        addSubview(storeImageView)
    }
    
    fileprivate lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        return titleLabel
    }()
    
    fileprivate lazy var detailLabel: UILabel = {
        
        let detailLabel = UILabel()
        detailLabel.font = UIFont.systemFont(ofSize: 14)
        detailLabel.textColor = KPGray()
        return detailLabel
    }()
    
    fileprivate lazy var specialOfferPriceLabel: UILabel = {
        
        let specialOfferPriceLabel = UILabel()
        specialOfferPriceLabel.font = UIFont.systemFont(ofSize: 25)
        specialOfferPriceLabel.textColor = KPGreen()
        return specialOfferPriceLabel
    }()
    
    fileprivate lazy var originPriceLabel: UILabel = {
        
        let originPriceLabel = UILabel()
        originPriceLabel.font = UIFont.systemFont(ofSize: 14)
        originPriceLabel.textColor = KPLightGray()
        return originPriceLabel
    }()
    
    fileprivate lazy var timeLabel: UILabel = {
        
        let timeLabel = UILabel()
        timeLabel.font = UIFont.systemFont(ofSize: 13)
        timeLabel.textColor = KPGreen()
        timeLabel.layer.borderWidth = 0.5
        timeLabel.layer.borderColor = KPGreen().cgColor
        timeLabel.layer.cornerRadius = 3
        timeLabel.layer.masksToBounds = true
        

        return timeLabel
    }()

    fileprivate lazy var storeImageView: UIImageView = {
        
        let storeImageView = UIImageView()
        return storeImageView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
