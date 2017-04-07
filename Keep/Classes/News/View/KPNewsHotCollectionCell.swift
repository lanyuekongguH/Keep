//
//  KPNewsHotCollectionCell.swift
//  Keep
//
//  Created by Damon on 17/4/6.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

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
    
    var hotItem: KPNewsHotItem! {
        didSet {
            
            let cellWidth = frame.width
            
            imageView.kf.setImage(with: URL(string: hotItem.photo!))
            contentLable.text = hotItem.content
            iconImageView.kf.setImage(with: URL(string: (hotItem.author?.avatar!)!))
            nameLable.text = hotItem.author?.username
            likeImageView.image = UIImage.init(named: "")
            likeNumberLabel.text = hotItem.likes
            
            imageView.snp.makeConstraints { (make) in
                make.width.height.equalTo(cellWidth)
                make.top.equalTo(0)
                make.left.equalTo(0)
            }
            
            contentLable.snp.makeConstraints { (make) in
                make.height.equalTo(35)
                make.width.equalTo(cellWidth)
                make.top.equalTo(imageView.snp.bottom).offset(10)
                make.left.equalTo(0)
            }
            
            iconImageView.snp.makeConstraints { (make) in
                make.height.width.equalTo(26)
                make.top.equalTo(contentLable.snp.bottom).offset(15)
                make.left.equalTo(0)
            }
            
            nameLable.snp.makeConstraints { (make) in
                make.height.equalTo(30)
                make.width.equalTo(100)
                make.top.equalTo(contentLable.snp.bottom).offset(15)
                make.left.equalTo(iconImageView.snp.right).offset(5)
            }
            
            
            let likeNumberW = hotItem.likes?.boundingRectWithFont(nameLable.font).width
            
//            let likeImageViewX = cellWidth - likeNumberW! - 5 - 5
            
            let likeImageViewX = cellWidth - 30
            
            likeImageView.snp.makeConstraints { (make) in
                make.height.width.equalTo(5)
                make.top.equalTo(contentLable.snp.bottom).offset(15)
                make.left.equalTo(likeImageViewX)
            }
            
            likeNumberLabel.snp.makeConstraints { (make) in
                make.height.equalTo(25)
                //make.width.equalTo(likeNumberW!)
                
                make.width.equalTo(20)

                make.top.equalTo(contentLable.snp.bottom).offset(15)
                make.left.equalTo(likeImageView.snp.right).offset(5)
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
        
        return likeImageView
    }()
    
    fileprivate lazy var likeNumberLabel: UILabel = {
        
        let likeNumberLabel = UILabel()
        likeNumberLabel.font = UIFont.systemFont(ofSize: 10)
        return likeNumberLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
