//
//  KPDiscoveryTrainCell.swift
//  Keep
//
//  Created by Damon on 17/5/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryTrainCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(timerScrollView)
    }

    fileprivate lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.systemFont(ofSize: 14)
        titleLabel.textColor = KPGray()
        return titleLabel
    }()
    
    fileprivate lazy var arrowButton: UIButton = {
        
        let arrowButton = UIButton()
        
        return arrowButton
    }()
    
    fileprivate lazy var timerScrollView: KPTimerScrollView = {
        
        let timerScrollView = KPTimerScrollView()
        
        return timerScrollView
    }()
    
    
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
