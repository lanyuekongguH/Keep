//
//  KPNewsDetailAuthorCell.swift
//  Keep
//
//  Created by Damon on 17/4/7.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsDetailAuthorCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addSubview(iconImageView)
        addSubview(nameLable)
        addSubview(timeLable)
        addSubview(likedButton)
        addSubview(photoImageView)
        addSubview(contentLable)
        
        addSubview(favoriteCountLable)
        addSubview(lineView)

        addSubview(bottomView)

        self.backgroundColor = UIColor.white
    }

    var hotDetailItem: KPHotDetailItem? {
        didSet {
            
            if let hotDetailItem = hotDetailItem {
            
                if let url = hotDetailItem.author?.avatar {
                    
                    iconImageView.kf.setImage(with: URL(string: url))
                }
                
                nameLable.text = hotDetailItem.author?.username
                
                timeLable.text = hotDetailItem.now
                
                if let photo = hotDetailItem.photo {
                    
                    photoImageView.kf.setImage(with: URL(string: photo))
                }
                
                contentLable.text = hotDetailItem.content
                
                favoriteCountLable.text = "\(hotDetailItem.externalShareCount!) 分享  \(hotDetailItem.favoriteCount!) 收藏"
                    
                iconImageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(15)
                    make.left.equalTo(15)
                }
                
                nameLable.snp.updateConstraints { (make) in
                    make.width.equalTo(200)
                    make.height.equalTo(15)
                    make.top.equalTo(iconImageView)
                    make.left.equalTo(iconImageView.snp.right).offset(10)
                }
                
                timeLable.snp.updateConstraints { (make) in
                    make.width.equalTo(200)
                    make.height.equalTo(13)
                    make.top.equalTo(nameLable.snp.bottom).offset(4)
                    make.left.equalTo(nameLable)
                }
                
                if let photo = hotDetailItem.photo {

                    let photoSize = photo.getImageViewSize()
                    
                    photoImageView.snp.updateConstraints { (make) in
                        make.width.equalTo(photoSize.width)
                        make.height.equalTo(photoSize.height)
                        make.top.equalTo(iconImageView.snp.bottom).offset(15)
                        make.left.equalTo(0)
                    }
                }
                
                let contentSize = contentLable.text?.boundingRectWithSize(CGSize(width: SCREENW - (40), height: 9999), contentLable.font)

                if let contentSize = contentSize {
                    contentLable.snp.updateConstraints { (make) in
                        
                        make.width.equalTo(contentSize.width)
                        make.height.equalTo(contentSize.height)
                        make.top.equalTo(photoImageView.snp.bottom).offset(15)
                        make.left.equalTo(20)
                    }
                }
                
                likedButton.snp.updateConstraints { (make) in
                    make.width.equalTo(80)
                    make.height.equalTo(20)
                    make.top.equalTo(contentLable.snp.bottom).offset(25)
                    make.left.equalTo(SCREENW - 80 - 20)
                }
                
                favoriteCountLable.snp.updateConstraints { (make) in
                    make.width.equalTo(200)
                    make.height.equalTo(15)
                    make.top.equalTo(contentLable.snp.bottom).offset(10)
                    make.left.equalTo(contentLable)
                }
                
                lineView.snp.updateConstraints { (make) in
                    make.width.equalTo(SCREENW - 40)
                    make.height.equalTo(0.5)
                    make.top.equalTo(favoriteCountLable.snp.bottom).offset(10)
                    make.left.equalTo(20)
                }
                
                bottomView.snp.updateConstraints { (make) in
                    make.width.equalTo(SCREENW)
                    make.height.equalTo(60)
                    make.top.equalTo(lineView.snp.bottom)
                    make.left.equalTo(0)
                }
            }
        }
    }
    
    class func heightOfAuthorCell(_ item: KPHotDetailItem?) -> CGFloat {
        
        if let item = item {
        
            let photoSize = item.photo?.getImageViewSize()
            
            let contentSize = item.content?.boundingRectWithSize(CGSize(width: SCREENW - (40), height: 9999), UIFont.systemFont(ofSize: 15))
            
            if let photoSize = photoSize, let contentSize = contentSize {
                let height = 15 + 30 + 15 + 15 + 25 + 60 + photoSize.height + contentSize.height
                
                return CGFloat(height)
            } else { return 0.1 }
            
        } else { return 0.1 }
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
        
        let iconImageView = UIImageView()
        iconImageView.layer.masksToBounds = true
        iconImageView.layer.cornerRadius = 15
        return iconImageView
    }()
    
    fileprivate lazy var nameLable: UILabel = {
        
        let nameLable = UILabel()
        nameLable.font = UIFont.systemFont(ofSize: 13)
        return nameLable
    }()
    
    fileprivate lazy var timeLable: UILabel = {
        
        let timeLable = UILabel()
        timeLable.font = UIFont.systemFont(ofSize: 13)
        return timeLable
    }()
    
    fileprivate lazy var likedButton: UIButton = {
        
        let likedButton = UIButton()
        return likedButton
    }()
    
    fileprivate lazy var photoImageView: UIImageView = {
        
        let photoImageView = UIImageView()
        return photoImageView
    }()
    
    fileprivate lazy var contentLable: UILabel = {
        
        let contentLable = UILabel()
        contentLable.numberOfLines = 0
        contentLable.font = UIFont.systemFont(ofSize: 15)
        return contentLable
    }()
    
    fileprivate lazy var favoriteCountLable: UILabel = {
        
        let favoriteCountLable = UILabel()
        favoriteCountLable.font = UIFont.systemFont(ofSize: 13)
        favoriteCountLable.textColor = KPLightGray()
        return favoriteCountLable
    }()
    
    fileprivate lazy var lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = KPLine()
        return lineView
    }()
    
    public lazy var bottomView: KPNewsHotBottomView = {
        
        let bottomView = KPNewsHotBottomView()
        return bottomView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
