//
//  KPDietScrollView.swift
//  Keep
//
//  Created by Damon on 17/5/11.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPDietScrollView: UIScrollView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }

}
