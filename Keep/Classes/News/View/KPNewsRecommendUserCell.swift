//
//  KPNewsRecommendUserCell.swift
//  Keep
//
//  Created by Damon on 17/4/12.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsRecommendUserCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLable)
        contentView.addSubview(timeLable)
        contentView.addSubview(contentLable)
        contentView.addSubview(likeButton)
        contentView.addSubview(commentButton)
    }
    
    var commentsItem: KPNewsCommentsItem! {
        didSet {
            
            if let url = commentsItem.author?.avatar {
            
                iconImageView.kf.setImage(with: URL(string: url))
            }
            
            nameLable.text = commentsItem.author?.username
            timeLable.text = commentsItem.created
            contentLable.text = commentsItem.content
            
            iconImageView.snp.updateConstraints { (make) in
                
                make.width.height.equalTo(30)
                make.top.equalTo(20)
                make.left.equalTo(20)
            }
            
            nameLable.snp.updateConstraints { (make) in
                
                make.height.equalTo(12)
                make.width.equalTo(100)
                make.top.equalTo(20)
                make.left.equalTo(iconImageView.snp.right).offset(10)
            }
            
            timeLable.snp.updateConstraints { (make) in
                
                make.height.equalTo(10)
                make.width.equalTo(100)
                make.top.equalTo(nameLable.snp.bottom).offset(5)
                make.left.equalTo(iconImageView.snp.right).offset(10)
            }
            
            let content = contentLable.text?.boundingRectWithSize(CGSize.init(width: SCREENW - 20 - 30 - 20 - 10, height: CGFloat(MAXFRAG)), contentLable.font)
            
            contentLable.snp.updateConstraints { (make) in
                make.width.equalTo((content?.width)!)
                make.height.equalTo((content?.height)!)
                make.top.equalTo(iconImageView.snp.bottom).offset(10)
                make.left.equalTo(nameLable)
            }
            
            likeButton.snp.updateConstraints { (make) in
                make.width.height.equalTo(10)
                make.top.equalTo(0)
                make.left.equalTo(0)
            }
            
            commentButton.snp.updateConstraints { (make) in
                make.width.height.equalTo(10)
                make.top.equalTo(0)
                make.left.equalTo(0)
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
        
        let iconImageView = UIImageView()
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 15
        return iconImageView
    }()
    
    fileprivate lazy var nameLable: UILabel = {
        
        let nameLable = UILabel()
        nameLable.font = UIFont.systemFont(ofSize: 12)
        nameLable.textColor = KPGray()
        return nameLable
    }()
    
    
    fileprivate lazy var timeLable: UILabel = {
        
        let timeLable = UILabel()
        timeLable.font = UIFont.systemFont(ofSize: 10)
        timeLable.textColor = KPLightGray()
        return timeLable
    }()
    
    
    fileprivate lazy var contentLable: UILabel = {
        
        let contentLable = UILabel()
        contentLable.numberOfLines = 0
        contentLable.font = UIFont.systemFont(ofSize: 14)
        contentLable.textColor = KPGray()
        return contentLable
    }()
    
    fileprivate lazy var likeButton: UIButton = {
        
        let likeButton = UIButton()

        return likeButton
    }()
    
    fileprivate lazy var commentButton: UIButton = {
        
        let commentButton = UIButton()
        
        return commentButton
    }()

}
