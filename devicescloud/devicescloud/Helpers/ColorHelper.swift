//
//  ColorHelper.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

/**
 *
 *  颜色的扩展
 *
 */
extension UIColor {
    // 颜色转换方法
    class func configColor(hexColor: String) -> UIColor {
        return configColor(hexColor: hexColor, alpha: 1.0)
    }
    
    class func configColor(hexColor: String, alpha: CGFloat) -> UIColor {
        // 存储转换后的数值
        var red: UInt32 = 0, green: UInt32 = 0, blue: UInt32 = 0
        // 计算前缀数量
        var prefixCount = 0
        
        if hexColor.hasPrefix("0x") || hexColor.hasPrefix("0X") {
            prefixCount = 2 // 前缀有两位
        }
        if hexColor.hasPrefix("#") {
            prefixCount = 1 // 前缀有一位
        }
        // 分别转换进行转换
        Scanner(string: hexColor[(0+prefixCount)..<(2+prefixCount)]).scanHexInt32(&red)
        
        Scanner(string: hexColor[(2+prefixCount)..<(4+prefixCount)]).scanHexInt32(&green)
        
        Scanner(string: hexColor[(4+prefixCount)..<(6+prefixCount)]).scanHexInt32(&blue)
        
        return UIColor(red: CGFloat(red)/255.0, green: CGFloat(green)/255.0, blue: CGFloat(blue)/255.0, alpha: alpha)
    }

}
