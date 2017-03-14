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
