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
        
        addSubview(favoritedButton)
        addSubview(commentButton)
        addSubview(shareButton)
        addSubview(moreButton)

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
                
                iconImageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(20)
                    make.left.equalTo(20)
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
                
                // _1516x1516.jpg
                
                //"http://static1.keepcdn.com/picture/2017/04/14/10/a40116bea42b05097aeef76bf4021c97c5d5d576_1280x1280.jpg"

                
                if let photo = hotDetailItem.photo {

                    
//                    photo.hasSuffix(<#T##suffix: String##String#>)
//                    photo.range(of: ".jpg")!.
//                    
//                    
//                    let str = photo as NSString
//                    
//                    let end = str.range(of: ".jpg").location
//                    let start = str.range(of: "_").location
//                    let gap = str.range(of: "x").location

                    
                    
                }
                
//                let photoW =
//                let photoH =

                photoImageView.snp.updateConstraints { (make) in
                    make.width.equalTo(200)
                    make.height.equalTo(200)
                    make.top.equalTo(timeLable.snp.bottom).offset(10)
                    make.left.equalTo(nameLable)
                }
                
                let contentSize = contentLable.text?.boundingRectWithSize(CGSize(width: SCREENW - (40), height: 9999), contentLable.font)

                contentLable.snp.updateConstraints { (make) in
                    
                    make.width.equalTo((contentSize?.width)!)
                    make.height.equalTo((contentSize?.height)!)
                    make.top.equalTo(photoImageView.snp.bottom).offset(20)
                    make.left.equalTo(20)
                }
                
                likedButton.snp.updateConstraints { (make) in
                    make.width.equalTo(80)
                    make.height.equalTo(20)
                    make.top.equalTo(contentLable.snp.bottom).offset(25)
                    make.left.equalTo(SCREENW - 80 - 20)
                }
                
                favoriteCountLable.snp.updateConstraints { (make) in
                    make.width.equalTo(100)
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
                
                favoritedButton.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(lineView.snp.bottom).offset(15)
                    make.left.equalTo(contentLable)
                }
                
                commentButton.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(lineView.snp.bottom).offset(15)
                    make.left.equalTo(favoritedButton.snp.right).offset(20)
                }
                
                shareButton.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(lineView.snp.bottom).offset(15)
                    make.left.equalTo(commentButton.snp.right).offset(20)
                }
                
                moreButton.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(lineView.snp.bottom).offset(15)
                    make.right.equalTo(SCREENW - 30 - 20)
                }
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
        return favoriteCountLable
    }()
    
    fileprivate lazy var lineView: UIView = {
        
        let lineView = UIView()
        return lineView
    }()
    
    fileprivate lazy var favoritedButton: UIButton = {
        
        let favoritedButton = UIButton()
        favoritedButton.setImage(UIImage(named: "icon_timeline_like"), for: .normal)
        favoritedButton.setImage(UIImage(named: "icon_timeline_like"), for: .highlighted)
        return favoritedButton
    }()
    
    fileprivate lazy var commentButton: UIButton = {
        
        let commentButton = UIButton()
        commentButton.setImage(UIImage(named: "icon_timeline_comment"), for: .normal)
        commentButton.setImage(UIImage(named: "icon_timeline_comment"), for: .highlighted)
        return commentButton
    }()
    
    fileprivate lazy var shareButton: UIButton = {
        
        let shareButton = UIButton()
        shareButton.setImage(UIImage(named: "icon_timeline_share"), for: .normal)
        shareButton.setImage(UIImage(named: "icon_timeline_share"), for: .highlighted)
        return shareButton
    }()
    
    fileprivate lazy var moreButton: UIButton = {
        
        let moreButton = UIButton()
        moreButton.setImage(UIImage(named: "icon_timeline_more"), for: .normal)
        moreButton.setImage(UIImage(named: "icon_timeline_more"), for: .highlighted)
        return moreButton
    }()
    
}
