//
//  KPHealthListCell.swift
//  Keep
//
//  Created by Damon on 17/4/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPHealthListCell: UITableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
    }

    var healthData: KPHealthData? {
        didSet {
            
            addSubview(countLabel)
            
            addSubview(timeLabel)

            if let healthData = healthData {
            
                let stepCount = String(stringInterpolationSegment: healthData.stepCount)
                
                countLabel.text = stepCount
                
                let components = healthData.startDateComponents!
                
                timeLabel.text = "\(components.year!)年\(components.month!)月\(components.day!)日"
            }
        }
    }
    
    fileprivate lazy var countLabel : UILabel = {
    
        let countLabel = UILabel()
        countLabel.frame = CGRect.init(x: 10, y: 0, width: 100, height: 40)
        return countLabel
    }()
    
   
    fileprivate lazy var timeLabel : UILabel = {
        
        let timeLabel = UILabel()
        timeLabel.frame = CGRect.init(x: SCREENW - 200 - 20, y: 0, width: 200, height: 40)
        timeLabel.textAlignment = .right
        return timeLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
