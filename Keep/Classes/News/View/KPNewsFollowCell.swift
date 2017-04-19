//
//  KPNewsFollowCell.swift
//  Keep
//
//  Created by Damon on 17/4/12.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPNewsFollowCell: UITableViewCell {

    var iconsArray = [UIImageView]()

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(likesLabel)
        
        addSubview(iconsView)

        addSubview(arrowImageView)
    }
    
    var hotDetailItem: KPHotDetailItem? {
        didSet {
            
            if let hotDetailItem = hotDetailItem {
                
                likesLabel.text = "\(hotDetailItem.likes!) 加油"
                
                if iconsArray.count == 0 {
                    
                    for i in 0...5 {
                    
                        let icon = UIImageView()
                        icon.frame = CGRect(x: i * 26, y: 0, width: 30, height: 30)
                        icon.layer.masksToBounds = true
                        icon.layer.cornerRadius = 15
                        iconsArray.append(icon)
                    }
                }
                
                let count = (hotDetailItem.likes! > 5) ? 5 : hotDetailItem.likes
                
                for i in 0...count! - 1 {
                
                    let icon = iconsArray[i]
                    
                    icon.kf.setImage(with: URL(string: (hotDetailItem.likers?[i].avatar!)!), placeholder: nil)
                    iconsView.addSubview(icon)
                }
                
                let likeNumberW = likesLabel.text?.boundingRectWithFont(likesLabel.font).width

                likesLabel.snp.updateConstraints { (make) in
                    make.height.equalTo(44)
                    make.width.equalTo(likeNumberW!)
                    make.top.equalTo(0)
                    make.left.equalTo(20)
                }
                
                iconsView.snp.updateConstraints { (make) in
                    make.height.equalTo(30)
                    make.width.equalTo(180)
                    make.top.equalTo(7)
                    make.left.equalTo(likesLabel.snp.right).offset(10)
                }
                
                arrowImageView.snp.updateConstraints { (make) in
                    make.height.equalTo(13)
                    make.width.equalTo(8)
                    make.top.equalTo(15)
                    make.left.equalTo(SCREENW - 8 - 10)
                }
            }
            
        }
    }
    
    fileprivate lazy var likesLabel: UILabel = {
        
        let likesLabel = UILabel()
        likesLabel.font = UIFont.systemFont(ofSize: 13)
        likesLabel.textColor = KPGray()
        return likesLabel
    }()
    
    fileprivate lazy var iconsView: UIView = {
        
        let iconsView = UIView()
        return iconsView
    }()
    
    fileprivate lazy var arrowImageView: UIImageView = {
    
        let arrowImageView = UIImageView()
        arrowImageView.image = UIImage.init(named: "arrow_more")
        return arrowImageView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
