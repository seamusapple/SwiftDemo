//
//  MoreHomeController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class MoreHomeController: BaseController {
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .blank)
        setNaviBar(title: "用户名")
    }
    
    private func addPageViews() {
        
    }
    
    private func layoutPageViews() {
    
    }
    
    private func setPageViews() {

    }
    
    // MARK: - Event Responses
    func editUserInfo() {
        
    }
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
}
