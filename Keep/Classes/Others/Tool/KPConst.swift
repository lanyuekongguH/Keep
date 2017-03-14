//
//  KPConst.swift
//  Keep
//
//  Created by Damon on 17/3/8.
//  Copyright © 2017年 Damon. All rights reserved.
//

import UIKit


func KPColor(_ r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}

func KPGreen() -> UIColor  {
    return KPColor(38, g: 191, b: 119, a: 1.0)
}

func KPTheme() -> UIColor {
    return KPColor(69, g: 60, b: 77, a: 1.0)
}

func KPBg() -> UIColor {
    return KPColor(231, g: 236, b: 240, a: 1.0)
}

func KPGray() -> UIColor {
    return KPColor(148, g: 148, b: 148, a: 1.0)
}

func KPLightGray() -> UIColor {
    return KPColor(142, g: 142, b: 142, a: 1.0)
}


/// iPhone 5
let isIPhone5 = SCREENH == 568 ? true : false
/// iPhone 6
let isIPhone6 = SCREENH == 667 ? true : false
/// iPhone 6P
let isIPhone6P = SCREENH == 736 ? true : false

/// 动画时长
let kAnimationDuration = 0.25
/// 屏幕的宽
let SCREENW = UIScreen.main.bounds.size.width
/// 屏幕的高
let SCREENH = UIScreen.main.bounds.size.height

