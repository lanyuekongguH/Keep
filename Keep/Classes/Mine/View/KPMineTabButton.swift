//
//  KPMineTabButton.swift
//  Keep
//
//  Created by Damon on 17/3/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPMineTabButton: UIButton {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.adjustsImageWhenHighlighted = false
        self.setTitleColor(UIColor.black, for: UIControlState())
        self.titleLabel?.font = UIFont.systemFont(ofSize: 11)
        self.titleLabel?.textAlignment = .center
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        
        // 按钮图片和标题总高度
        let totalHeight: CGFloat
        totalHeight = ((self.imageView?.frame.size.height)! + (self.titleLabel?.frame.size.height)!);
        
        // 设置按钮图片偏移
        self.imageEdgeInsets = UIEdgeInsetsMake(-(totalHeight - (self.imageView?.frame.size.height)!), 0.0, 0.0, -(self.titleLabel?.frame.size.width)!)
        
        
        // 设置按钮标题偏移
        self.titleEdgeInsets = UIEdgeInsetsMake(0.0, -(self.imageView?.frame.size.width)!, -(totalHeight - (self.titleLabel?.frame.size.height)!),0.0)
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
