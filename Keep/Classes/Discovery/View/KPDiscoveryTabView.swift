//
//  KPDiscoveryTabView.swift
//  Keep
//
//  Created by Damon on 17/5/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDiscoveryTabView: UIView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
    }
    
    var tabTitles: [String]? {
        didSet {
            
            if let tabTitles = tabTitles {
                
                let buttonW :CGFloat = 50.0
                let buttonD = (SCREENW - CGFloat(50 * tabTitles.count))/CGFloat(tabTitles.count * 2)

                for i in 0..<tabTitles.count {
                    
                    let buttonX = buttonD * CGFloat(i*2+1) + buttonW * CGFloat(i)
                    let button = UIButton()
                    button.frame = CGRect.init(x: buttonX, y: 0, width: buttonW, height: 44)
                    button.tag = i
                    button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
                    button.setTitle(tabTitles[i], for: UIControlState())
                    button.setTitleColor(KPGreen(), for: UIControlState())
                    button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
                    addSubview(button)
                }
                
            }
        }
    }
    
    @objc fileprivate func buttonClick(_ button:UIButton) {

    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
}
