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
    }
    
    
    func addSwipeRightButtons() -> Void{
        
        var rightButtons : [AnyObject] = [AnyObject]()
        
        let deleteButton = UIButton()
        
        deleteButton.backgroundColor = KPTable()
        deleteButton.setTitleColor(UIColor.white, for: .normal)
        deleteButton.setTitle("修改", for: .normal)
        deleteButton.titleLabel?.adjustsFontSizeToFitWidth = true
        rightButtons.append(deleteButton)
        
        self.rightUtilityButtons = rightButtons
    }
    
    fileprivate func setupUI() {
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
