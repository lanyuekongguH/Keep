//
//  KPTrainActionListCell.swift
//  Keep
//
//  Created by 舒明明 on 17/5/23.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTrainActionListCell: UITableViewCell {

    

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    
    fileprivate lazy var nameLabel: UILabel = {
        
        let nameLabel = UILabel()
        return nameLabel
    }()
    
    fileprivate lazy var timeLabel: UILabel = {
        
        let timeLabel = UILabel()
        return timeLabel
    }()
    
    fileprivate lazy var imageView: UIImageView = {
        
        let imageView = UIImageView()
        return imageView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
