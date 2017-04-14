//
//  String+KP.swift
//  Keep
//
//  Created by Damon on 17/3/14.
//  Copyright © 2017年 Damon. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
    }
    
    func toFloat() -> Float? {
        return NumberFormatter().number(from: self)?.floatValue
    }
    
    func toCGFloat() -> CGFloat? {
        return CGFloat(NumberFormatter().number(from: self)!)
    }
}

extension String {
    
    /// 返回图片大小比例
    func getImageViewSize() -> CGSize {
    
        let range1 = self.range(of: "_")
        let range2 = self.range(of: "x")
        let range3 = self.range(of: ".jpg")

        let imageW: String?
        let imageH: String?

        imageW = self.substring(with: (range1?.upperBound)!..<(range2?.lowerBound)!)

        imageH = self.substring(with: (range2?.upperBound)!..<(range3?.lowerBound)!)

        let rate = (imageH?.toCGFloat())! / (imageW?.toCGFloat())!
        
        return  CGSize(width: SCREENW, height: SCREENW * rate)

    }
    
    
    /// 返回文字的高度
    func boundingRectWithSize(_ size: CGSize, _ font: UIFont) -> CGSize {
        
        let title: NSString = self as NSString
        let size = title.boundingRect(with: size, options: NSStringDrawingOptions.usesLineFragmentOrigin, attributes: [NSFontAttributeName: font], context: nil).size
        
        return CGSize(width: size.width + 1, height: size.height + 1)
    }
    
    func boundingRectWithFont(_ font: UIFont) -> CGSize {
        return self.boundingRectWithSize(CGSize(width: CGFloat(FLT_MAX), height: CGFloat(FLT_MAX)), font)
    }
    
}
