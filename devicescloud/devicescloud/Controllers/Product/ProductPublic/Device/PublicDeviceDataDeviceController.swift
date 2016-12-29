//
//  PublicDeviceDataDeviceController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/15.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class PublicDeviceDataDeviceController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: TextStr.dataDetail)
    }
    
    private func addPageViews() {
        
    }
    
    private func layoutPageViews() {
        
    }
    
    private func setPageViews() {
        
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
//    fileprivate var <#name#>_: <#type#>?
}
