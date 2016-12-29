//
//  ProductDetailController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/9.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

class ProductDetailController: BaseController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setNavigationBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Controller Settings
    func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: TextStr.productDetailTitle)
    }
}
