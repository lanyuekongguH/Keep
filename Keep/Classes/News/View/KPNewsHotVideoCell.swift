//
//  KPNewsHotVideoCell.swift
//  Keep
//
//  Created by Damon on 17/4/19.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsHotVideoCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        
        addSubview(iconImageView)
        addSubview(nameLable)
        addSubview(timeLable)
        addSubview(videoImageView)
        
        addSubview(playImageView)
        addSubview(countdownImageView)
        addSubview(countdownLable)
        addSubview(playCountLable)
        
        addSubview(contentLable)
        addSubview(bottomView)
        addSubview(lineView)

        addSubview(favoriteImageView)
        addSubview(favoriteCountLable)
    }
    
    var hotDetailItem: KPHotDetailItem? {
        didSet {
            
            if let hotDetailItem = hotDetailItem {
                
                if let url = hotDetailItem.author?.avatar {
                    
                    iconImageView.kf.setImage(with: URL(string: url))
                }
                
                nameLable.text = hotDetailItem.author?.username

                timeLable.text = hotDetailItem.created
                
                print("hotDetailItem.now",hotDetailItem.created ?? "dd")
                
                if let photo = hotDetailItem.photo {
                    
                    videoImageView.kf.setImage(with: URL(string: photo))
                }
                
                contentLable.text = hotDetailItem.content
                
                iconImageView.snp.updateConstraints { (make) in
                    make.width.height.equalTo(30)
                    make.top.equalTo(15)
                    make.left.equalTo(15)
                }
                
                nameLable.snp.updateConstraints { (make) in
                    make.width.equalTo(200)
                    make.height.equalTo(30)
                    make.top.equalTo(15)
                    make.left.equalTo(iconImageView.snp.right).offset(10)
                }
                
                if let text = timeLable.text {
                
                    let timeW = text.boundingRectWithFont(timeLable.font).width
                    timeLable.snp.updateConstraints { (make) in
                        make.height.equalTo(30)
                        make.width.equalTo(timeW)
                        make.top.equalTo(15)
                        make.left.equalTo(SCREENW - timeW - 10)
                    }
                }
                
                if let photo = hotDetailItem.photo {
                    
                    let photoSize = photo.getImageViewSize()
                    
                    videoImageView.snp.updateConstraints { (make) in
                        make.width.equalTo(photoSize.width)
                        make.height.equalTo(photoSize.height)
                        make.top.equalTo(iconImageView.snp.bottom).offset(15)
                        make.left.equalTo(0)
                    }
                    
                    playImageView.snp.updateConstraints { (make) in
                        make.width.height.equalTo(79)
                        make.top.equalTo(videoImageView).offset((photoSize.height - 79)/2.0)
                        make.left.equalTo((SCREENW - 79)/2.0)
                    }
                    
                    countdownImageView.snp.updateConstraints { (make) in
                        make.width.height.equalTo(79)
                        make.top.equalTo(videoImageView).offset((photoSize.height - 79)/2.0)
                        make.left.equalTo((SCREENW - 79)/2.0)
                    }
                    
                    countdownLable.snp.updateConstraints { (make) in
                        make.width.height.equalTo(79)
                        make.top.equalTo(videoImageView).offset((photoSize.height - 79)/2.0)
                        make.left.equalTo((SCREENW - 79)/2.0)
                    }
                    
                    playCountLable.snp.updateConstraints { (make) in
                        make.width.height.equalTo(79)
                        make.top.equalTo(videoImageView).offset((photoSize.height - 79)/2.0)
                        make.left.equalTo((SCREENW - 79)/2.0)
                    }
                }
                
                
                if let text = contentLable.text {
                
                    var contentSize = text.boundingRectWithSize(CGSize(width: SCREENW - (40), height: 9999), contentLable.font)
                    
                    if contentSize.height > CGFloat(100) {
                        contentSize.height = 100
                    }
                    
                    contentLable.snp.updateConstraints { (make) in
                        make.width.equalTo(contentSize.width)
                        make.height.equalTo(contentSize.height)
                        make.top.equalTo(videoImageView.snp.bottom).offset(15)
                        make.left.equalTo(20)
                    }
                }
                
                bottomView.snp.updateConstraints { (make) in
                    make.width.equalTo(SCREENW)
                    make.height.equalTo(60)
                    make.top.equalTo(contentLable.snp.bottom)
                    make.left.equalTo(0)
                }
                
//                favoriteCountLable.snp.updateConstraints { (make) in
//                    make.width.equalTo(30)
//                    make.top.equalTo(15)
//                    make.left.equalTo(15)
//                }
            }
            
        }
        
    }
    
    class func heightOfHotVideoCell(_ item: KPHotDetailItem?) -> CGFloat {
        
        if let item = item {
            
            if let photo = item.photo, let content = item.content {
            
                let photoSize = photo.getImageViewSize()
                
                var contentSize = content.boundingRectWithSize(CGSize(width: SCREENW - (40), height: 9999), UIFont.systemFont(ofSize: 15))
                
                if contentSize.height > CGFloat(100) {
                    contentSize.height = 100
                }
            
                //let height = 15 + 30 + 15 + 15 + 25 + 60 + photoSize.height + contentSize.height
                let height = 160 + photoSize.height + contentSize.height
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
        nameLable.font = UIFont.systemFont(ofSize: 15)
        nameLable.textColor = UIColor.black
        return nameLable
    }()
    
    fileprivate lazy var timeLable: UILabel = {
        
        let timeLable = UILabel()
        timeLable.font = UIFont.systemFont(ofSize: 11)
        timeLable.textColor = KPLightGray()
        return timeLable
    }()
    
    fileprivate lazy var videoImageView: UIImageView = {
        
        let videoImageView = UIImageView()
        return videoImageView
    }()
    
    fileprivate lazy var playImageView: UIImageView = {
        
        let playImageView = UIImageView()
        playImageView.image = UIImage(named: "video_play_big")
        return playImageView
    }()
    
    
    fileprivate lazy var playCountLable: UILabel = {
        
        let playCountLable = UILabel()
        playCountLable.font = UIFont.systemFont(ofSize: 15)
        playCountLable.textColor = UIColor.white
        return playCountLable
    }()
    
    fileprivate lazy var countdownImageView: UIImageView = {
        
        let countdownImageView = UIImageView()
        return countdownImageView
    }()

    fileprivate lazy var countdownLable: UILabel = {
        
        let countdownLable = UILabel()
        countdownLable.font = UIFont.systemFont(ofSize: 15)
        countdownLable.textColor = UIColor.white
        return countdownLable
    }()
    
    fileprivate lazy var contentLable: UILabel = {
        
        let contentLable = UILabel()
        contentLable.numberOfLines = 0
        contentLable.font = UIFont.systemFont(ofSize: 15)
        contentLable.textColor = KPDetail()
        return contentLable
    }()
    
    fileprivate lazy var bottomView: KPNewsHotBottomView = {
        
        let bottomView = KPNewsHotBottomView()
        return bottomView
    }()
    
    fileprivate lazy var lineView: UIView = {
        
        let lineView = UIView()
        lineView.backgroundColor = KPLine()
        return lineView
    }()
    
    fileprivate lazy var favoriteImageView: UIImageView = {
        
        let favoriteImageView = UIImageView()
        return favoriteImageView
    }()
    
    fileprivate lazy var favoriteCountLable: UILabel = {
        
        let favoriteCountLable = UILabel()
        favoriteCountLable.font = UIFont.systemFont(ofSize: 13)
        favoriteCountLable.textColor = KPLightGray()
        return favoriteCountLable
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
