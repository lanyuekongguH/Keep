//
//  KPNewsHotCollectionCell.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import SDWebImage

class KPNewsHotCollectionCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        contentView.addSubview(contentLable)
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLable)
        contentView.addSubview(likeImageView)
        contentView.addSubview(likeNumberLabel)
        
        self.backgroundColor = UIColor.white
        
    }
    
    var hotItem: KPNewsHotItem? {
        didSet {
            
            if let hotItem = hotItem {
            
                let cellWidth = frame.width
                
                imageView.kf.setImage(with: URL(string: hotItem.photo!), placeholder: UIImage(named: "placeholder200_200"))
                
//                KPNetworkTool.shareNetworkTool.loadWebpData(urlStr: nil) {[weak self]  data in
//                    
//                    self?.imageView.image = UIImage.sd_image(withWebPData: data)
//                }
                
                contentLable.text = hotItem.content
                iconImageView.kf.setImage(with: URL(string: (hotItem.author?.avatar!)!))
                nameLable.text = hotItem.author?.username
                likeImageView.image = UIImage(named: "icon_timeline_liked")
                likeNumberLabel.text = String(hotItem.likes)
                
                imageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(cellWidth)
                    make.top.equalTo(0)
                    make.left.equalTo(0)
                }
                
                contentLable.snp.updateConstraints { (make) in
                    make.height.equalTo(35)
                    make.width.equalTo(cellWidth)
                    make.top.equalTo(imageView.snp.bottom).offset(10)
                    make.left.equalTo(0)
                }
                
                iconImageView.snp.updateConstraints { (make) in
                    make.height.width.equalTo(26)
                    make.top.equalTo(contentLable.snp.bottom).offset(15)
                    make.left.equalTo(0)
                }
                
                nameLable.snp.updateConstraints { (make) in
                    make.height.equalTo(26)
                    make.width.equalTo(100)
                    make.top.equalTo(contentLable.snp.bottom).offset(15)
                    make.left.equalTo(iconImageView.snp.right).offset(5)
                }
                
                let likeNumberW = String(hotItem.likes).boundingRectWithFont(likeNumberLabel.font).width
                
                let likeImageViewX = cellWidth - likeNumberW - 16 - 5
                
                
                likeImageView.snp.updateConstraints { (make) in
                    make.width.equalTo(16)
                    make.height.equalTo(26)
                    make.top.equalTo(contentLable.snp.bottom).offset(15)
                    make.left.equalTo(likeImageViewX)
                }
                
                likeNumberLabel.snp.updateConstraints { (make) in
                    make.height.equalTo(26)
                    make.width.equalTo(likeNumberW)
                    make.top.equalTo(contentLable.snp.bottom).offset(15)
                    make.left.equalTo(likeImageView.snp.right).offset(5)
                }
            }
            
        }
    }
    
    fileprivate lazy var imageView: UIImageView = {
    
        let imageView = UIImageView()
        
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    fileprivate lazy var contentLable: UILabel = {
        
        let contentLable = UILabel()
        contentLable.numberOfLines = 2
        contentLable.font = UIFont.systemFont(ofSize: 13)
        return contentLable
    }()
    
    fileprivate lazy var iconImageView: UIImageView = {
        
        let iconImageView = UIImageView()
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 13
        return iconImageView
    }()
    
    fileprivate lazy var nameLable: UILabel = {
        
        let nameLable = UILabel()
        nameLable.font = UIFont.systemFont(ofSize: 10)
        nameLable.textColor = KPLightGray()
        return nameLable
    }()
    
    fileprivate lazy var likeImageView: UIImageView = {
        
        let likeImageView = UIImageView()
        likeImageView.contentMode = .scaleAspectFit
        return likeImageView
    }()
    
    fileprivate lazy var likeNumberLabel: UILabel = {
        
        let likeNumberLabel = UILabel()
        likeNumberLabel.font = UIFont.systemFont(ofSize: 10)
        likeNumberLabel.textColor = KPLightGray()
        return likeNumberLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
