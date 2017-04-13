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
        
        contentView.addSubview(iconImageView)
        contentView.addSubview(nameLable)
        contentView.addSubview(timeLable)
        contentView.addSubview(likedButton)
        contentView.addSubview(photoImageView)
        contentView.addSubview(contentLable)
        
        contentView.addSubview(favoriteCountLable)
        contentView.addSubview(lineView)
        
        contentView.addSubview(favoritedButton)
        contentView.addSubview(commentButton)
        contentView.addSubview(shareButton)
        contentView.addSubview(moreButton)

        
        self.backgroundColor = UIColor.white
    }

    
    var hotDetailItem: KPHotDetailItem! {
        didSet {
    
            
            
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
        
        let iconImageView = UIImageView()
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
        contentLable.font = UIFont.systemFont(ofSize: 13)
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
        return favoritedButton
    }()
    
    fileprivate lazy var commentButton: UIButton = {
        
        let commentButton = UIButton()
        return commentButton
    }()
    
    fileprivate lazy var shareButton: UIButton = {
        
        let likedButton = UIButton()
        return likedButton
    }()
    
    fileprivate lazy var moreButton: UIButton = {
        
        let moreButton = UIButton()
        return moreButton
    }()
    
}
