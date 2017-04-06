//
//  KPWidgetButton.swift
//  Today
//
//  Created by Damon on 17/3/31.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPWidgetButton: UIButton {

    init(frame:CGRect, imageName:String, title:String) {
        super.init(frame: frame)
    
        addSubview(iconImageView)
        
        addSubview(contentLabel)
        
        iconImageView.image = UIImage(named: imageName)
        
        contentLabel.text = title
        
        iconImageView.frame = CGRect.init(x: (frame.size.width-35)/2, y: 0, width: 35, height: 35)
        
        contentLabel.frame = CGRect.init(x: 0, y: 50, width: frame.size.width, height: 20)
    }
    
    fileprivate lazy var iconImageView: UIImageView = {
    
        let iconImageView = UIImageView()
        return iconImageView
    }()
    
    fileprivate lazy var contentLabel: UILabel = {
        
        let contentLabel = UILabel()
        contentLabel.font = UIFont.systemFont(ofSize: 13)
        contentLabel.textColor = UIColor.black
        contentLabel.textAlignment = .center
        return contentLabel
    }()
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
