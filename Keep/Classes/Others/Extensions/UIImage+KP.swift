//
//  UIImage+KP.swift
//  Keep
//
//  Created by Damon on 17/3/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

extension UIImage {

    class func stretchImage(_ name: String) -> UIImage {
        return self.stretchImage(name, Int(0.5), Int(0.5))
    }

    class func stretchImage(_ name: String, _ leftScale:Int, _ topScale:Int) -> UIImage {
        let image = UIImage(named: name)
        
        return (image?.stretchableImage(withLeftCapWidth: leftScale, topCapHeight: topScale))!
    }

}
