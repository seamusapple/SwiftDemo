//
//  UISearchBarHelper.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/12.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
/**
 *
 *  UISearchBar的扩展
 *
 */

extension UISearchBar {
    func setCancelButton(font: UIFont) {
        UIBarButtonItem.appearance(whenContainedInInstancesOf: [UISearchBar.self]).setTitleTextAttributes([NSFontAttributeName : font], for: .normal)
    }
    
    func setSearchField(textColor: UIColor, textFont: UIFont) {
        
    }
}
