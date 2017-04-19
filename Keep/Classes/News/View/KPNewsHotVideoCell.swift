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
        
    }
    
    var hotDetailItem: KPHotDetailItem? {
        didSet {
            
            if let hotDetailItem = hotDetailItem {
                
            }
            
        }
        
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
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
