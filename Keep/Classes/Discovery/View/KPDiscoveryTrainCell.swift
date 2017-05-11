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
        
        self.selectionStyle = .none

        contentView.addSubview(titleLabel)
        contentView.addSubview(arrowButton)
        contentView.addSubview(trainScrollView)
    }
    
    var courses:KPDiscoveryTrainItem? {
    
        didSet {
            
            if let courses = courses, let sectionName = courses.sectionName, let plans = courses.plans {
                
                titleLabel.text = sectionName
                
                trainScrollView.plans = plans
                
                self.titleLabel.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(10)
                    make.width.equalTo(200)
                    make.height.equalTo(40)
                    make.top.equalTo(0)
                })
                
                self.arrowButton.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(SCREENW - 30)
                    make.width.equalTo(30)
                    make.height.equalTo(40)
                    make.top.equalTo(0)
                })
                
                self.trainScrollView.snp.makeConstraints({ (make) in
                    
                    make.left.equalTo(0)
                    make.width.equalTo(SCREENW)
                    make.height.equalTo(120)
                    make.top.equalTo(self.titleLabel.snp.bottom).offset(0)
                })
            }
        }
    }
    
    fileprivate lazy var titleLabel: UILabel = {
        
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 12)
        titleLabel.textColor = KPTheme()
        return titleLabel
    }()
    
    fileprivate lazy var arrowButton: UIButton = {
        
        let arrowButton = UIButton()
        arrowButton.setImage(UIImage(named: "arrow_more"), for: .normal)
        arrowButton.setImage(UIImage(named: "arrow_more"), for: .highlighted)
        return arrowButton
    }()
    
    fileprivate lazy var trainScrollView: KPTrainScrollView = {
        
        let trainScrollView = KPTrainScrollView()
        return trainScrollView
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
