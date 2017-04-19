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
    return KPColor(38.0, g: 191.0, b: 119.0, a: 1.0)
}

func KPTheme() -> UIColor {
    return KPColor(69.0, g: 60.0, b: 77.0, a: 1.0)
}

func KPBg() -> UIColor {
    return KPColor(231.0, g: 236.0, b: 240.0, a: 1.0)
}

func KPGray() -> UIColor {
    return KPColor(148.0, g: 148.0, b: 148.0, a: 1.0)
}

func KPLightGray() -> UIColor {
    return KPColor(142.0, g: 142.0, b: 142.0, a: 1.0)
}

func KPLine() -> UIColor {
    return KPColor(240.0, g: 240.0, b: 240.0, a: 1.0)
}

func KPTable() -> UIColor {
    return KPColor(229.0, g: 235.0, b: 239.0, a: 1.0)
}

func KPSWColor() -> UIColor {
    return KPColor(199.0, g: 199.0, b: 204.0, a: 1.0)
}

func KPRed() -> UIColor {
    return KPColor(252.0, g: 61.0, b: 57.0, a: 1.0)
}

func KPDetail() -> UIColor {
    return KPColor(55.0, g: 55.0, b: 55.0, a: 1.0)
}

func KPComment() -> UIColor {
    return KPColor(114.0, g: 114.0, b: 114.0, a: 1.0)
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

