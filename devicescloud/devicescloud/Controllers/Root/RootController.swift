//
//  RootController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/11/17.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class RootController: UITabBarController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setSubController()
        setTabBarItem()
        setBorderColor()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Controller Settings
    private func setSubController() {
        let productNav = UINavigationController(rootViewController: productHomeController)
        let discoveryNav = UINavigationController(rootViewController: discoveryHomeController)
        let notificationNav = UINavigationController(rootViewController: notificationHomeController)
        let moreNav = UINavigationController(rootViewController: moreHomeController)
        viewControllers = [productNav, discoveryNav, notificationNav, moreNav]
    }
    
    private func setTabBarItem() {
        tabBar.barTintColor = Color.hexwhite
        tabBar.isTranslucent = false
        
        let productItem = tabBar.items![0]
        let discoveryItem = tabBar.items![1]
        let notificationItem = tabBar.items![2]
        let moreItem = tabBar.items![3]
        
        let attributesOn = [
            NSForegroundColorAttributeName : Color.hex19bbff,
            NSFontAttributeName : Font.size10
        ]
        
        let attributesOff = [
            NSForegroundColorAttributeName: Color.hex7a7e89,
            NSFontAttributeName: Font.size10
        ]
        
        productItem.title = TextStr.product
        productItem.setTitleTextAttributes(attributesOff, for: .normal)
        productItem.setTitleTextAttributes(attributesOn , for: UIControlState.selected)
        
        discoveryItem.title = TextStr.discovery
        discoveryItem.setTitleTextAttributes(attributesOff, for: .normal)
        discoveryItem.setTitleTextAttributes(attributesOn, for: UIControlState.selected)
        
        notificationItem.title = TextStr.notification
        notificationItem.setTitleTextAttributes(attributesOff, for: .normal)
        notificationItem.setTitleTextAttributes(attributesOn , for: UIControlState.selected)
        
        moreItem.title = TextStr.more
        moreItem.setTitleTextAttributes(attributesOff, for: .normal)
        moreItem.setTitleTextAttributes(attributesOn, for: UIControlState.selected)
        
        productItem.image = UIImage(named: Icon.productOff)?.withRenderingMode(.alwaysOriginal)
        productItem.selectedImage = UIImage(named: Icon.productOn)?.withRenderingMode(.alwaysOriginal)
        
        discoveryItem.image = UIImage(named: Icon.discoveryOff)?.withRenderingMode(.alwaysOriginal)
        discoveryItem.selectedImage = UIImage(named: Icon.discoveryOn)?.withRenderingMode(.alwaysOriginal)
        
        notificationItem.image = UIImage(named: Icon.notificationOff)?.withRenderingMode(.alwaysOriginal)
        notificationItem.selectedImage = UIImage(named: Icon.notificationOn)?.withRenderingMode(.alwaysOriginal)
        
        moreItem.image = UIImage(named: Icon.moreOff)?.withRenderingMode(.alwaysOriginal)
        moreItem.selectedImage = UIImage(named: Icon.moreOn)?.withRenderingMode(.alwaysOriginal)
    }
    
    // MARK: - Priate Methods
    private func setBorderColor() {
        tabBar.backgroundImage = UIImage.forBar(color: Color.hexwhite)
        tabBar.shadowImage = UIImage.forBar(color: Color.hexd4d6d8)
    }
    
    // MARK: - Controller Attributes
    fileprivate var productHomeController_: ProductHomeController?
    fileprivate var discoveryHomeController_: DiscoveryHomeController?
    fileprivate var notificationHomeController_: NotificationHomeController?
    fileprivate var moreHomeController_: MoreHomeController?
}

// MARK: - Getters and Setters
extension RootController {
    fileprivate var productHomeController: ProductHomeController {
        if productHomeController_ == nil {
            productHomeController_ = ProductHomeController()
            return productHomeController_!
        }
        
        return productHomeController_!
    }
    
    fileprivate var discoveryHomeController: DiscoveryHomeController {
        if discoveryHomeController_ == nil {
            discoveryHomeController_ = DiscoveryHomeController()
            return discoveryHomeController_!
        }
        
        return discoveryHomeController_!
    }
    
    fileprivate var notificationHomeController: NotificationHomeController {
        if notificationHomeController_ == nil {
            notificationHomeController_ = NotificationHomeController()
            return notificationHomeController_!
        }
        
        return notificationHomeController_!
    }
    
    fileprivate var moreHomeController: MoreHomeController {
        if moreHomeController_ == nil {
            moreHomeController_ = MoreHomeController()
            return moreHomeController_!
        }
        
        return moreHomeController_!
    }
}
