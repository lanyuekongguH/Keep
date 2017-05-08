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
                
                for i in 0..<tabTitles.count {
                    
                    let button = UIButton()
                    button.tag = i
                    button.addTarget(self, action: #selector(buttonClick(_:)), for: .touchUpInside)
                    button.setTitle(tabTitles[i], for: UIControlState())
                    button.setTitleColor(KPGreen(), for: UIControlState())
                    
                    
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
