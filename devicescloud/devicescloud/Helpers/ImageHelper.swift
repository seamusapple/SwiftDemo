//
//  ImageHelper.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/6.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
/**
 *
 *  UIImage的扩展
 *
 */

extension UIImage {
    class func forBar(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: (1 / Size.screenScale), height: (1 / Size.screenScale))
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return image!
    }
    
    func scaledToMaxSize(size: CGSize) -> UIImage {
        let width = size.width
        let height = size.height
        
        let oldWidth = self.size.width
        let oldHeight = self.size.height
        
        let scaleFactor = (oldWidth > oldHeight) ? width / oldWidth : height / oldHeight
        
        if scaleFactor > 1.0 {
            return self
        }
        
        let newWidth = oldWidth * scaleFactor
        let newHeight = oldHeight * scaleFactor
        
        let newSize = CGSize(width: newWidth, height: newHeight)
        
        UIGraphicsBeginImageContextWithOptions(newSize, false, 0.0)
        self.draw(in: CGRect(x: 0, y: 0, width: newSize.width, height: newSize.height))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}
