//
//  KPTimerScrollView.swift
//  Keep
//
//  Created by Damon on 17/5/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

class KPTimerScrollView: UIScrollView {

    override init(frame:CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }

    fileprivate func setupUI() {
        
    }
    
    var imageNames: [String]? {
        didSet {
            
            if let imageNames = imageNames {
                
                let imageSize = imageNames[0].getImageViewSize()
                
                self.contentSize = CGSize(width: imageSize.width *  CGFloat(imageNames.count), height: imageSize.height)
                
                for i in 0..<imageNames.count {
                
                    let imageView = UIImageView()
                    imageView.frame = CGRect(x: CGFloat(i) * imageSize.width, y: 0, width: SCREENW, height: imageSize.height)
                    imageView.isUserInteractionEnabled = true
                    imageView.kf.setImage(with: URL(string: imageNames[i]))
                    addSubview(imageView)
                    
                }
            }
        }
    }
    
    required init?(coder aDecoder: NSCoder){
        fatalError("init(coder:) has not been implemented")
    }
    
}
