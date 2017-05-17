//
//  UIImage+KP.swift
//  Keep
//
//  Created by Damon on 17/3/9.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit

extension UIImage {

    class func stretchImage(_ name: String) -> UIImage? {
        return self.stretchImage(name, Int(0.5), Int(0.5))
    }

    class func stretchImage(_ name: String, _ leftScale:Int, _ topScale:Int) -> UIImage? {
        
        return UIImage(named: name)?.stretchableImage(withLeftCapWidth: leftScale, topCapHeight: topScale)
    }

    class func createImage(_ color: UIColor) -> UIImage? {

        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0)
        UIGraphicsBeginImageContext(rect.size);
        let context = UIGraphicsGetCurrentContext();
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let theImage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return theImage;
    }
    
}
