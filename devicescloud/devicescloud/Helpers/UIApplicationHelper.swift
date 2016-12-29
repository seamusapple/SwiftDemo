//
//  UIApplicationHelper.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/2.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
/**
 *
 *  UIApplication的扩展
 *
 */

extension UIApplication {
    class func topViewController(base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let nav = base as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        
        if let tab = base as? UITabBarController {
            if let selected = tab.selectedViewController {
                return topViewController(base: selected)
            }
        }
        
        if let presented = base?.presentedViewController {
            return topViewController(base: presented)
        }
        
        return base
    }
}
