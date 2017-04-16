//
//  KPTrainPlanListCell.swift
//  Keep
//
//  Created by Damon on 17/4/10.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit
import SWTableViewCell

class KPTrainPlanListCell: SWTableViewCell {

    override init(style: UITableViewCellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupUI()
        
        addSwipeRightButtons()
    }
    
    func addSwipeRightButtons() {
        
        var rightButtons : [AnyObject] = [AnyObject]()
        
        let quitButton = UIButton()
        quitButton.backgroundColor = KPRed()
        quitButton.setTitleColor(UIColor.white, for: .normal)
        quitButton.setTitle("退出", for: .normal)
        quitButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        let topButton = UIButton()
        topButton.backgroundColor = KPSWColor()
        topButton.setTitleColor(UIColor.white, for: .normal)
        topButton.setTitle("置顶", for: .normal)
        topButton.titleLabel?.adjustsFontSizeToFitWidth = true
        
        rightButtons.append(topButton)
        rightButtons.append(quitButton)

        self.rightUtilityButtons = rightButtons
    }
    
    fileprivate func setupUI() {
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
