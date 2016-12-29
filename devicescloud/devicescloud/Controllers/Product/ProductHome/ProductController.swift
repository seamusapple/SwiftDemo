//
//  ProductController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/13.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit

enum productType: String {
    case privateProduct = "private"
    case publicProduct = "public"
}

class ProductController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Init Methods
//    init(index: Int, productInfo: Int) {
//        super.init(nibName: nil, bundle: nil)
//        
//        self.index = index
//        self.proType = .publicProduct
////        self.productID = // TODO: 取出相应字段
//    }
    //测试
    init(index: Int, protocolType: productType) {
        super.init(nibName: nil, bundle: nil)
        
        self.index = index
        self.proType = protocolType
        //        self.productID = // TODO: 取出相应字段
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: "产品名字")
    }
    
    private func addPageViews() {
        view.addSubview(slideView)
    }
    
    private func layoutPageViews() {
        slideView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.edges.equalTo(view)
        }
    }
    
    private func setPageViews() {
        var itemArray = [DLScrollTabbarItem]()
        for str in TextStr.productSegmentTitle[(proType?.rawValue)!]! {
            itemArray.append(DLScrollTabbarItem(title: str, width: (Size.screenWidth / CGFloat(4))))
        }
        
        tabbar.tabbarItems = itemArray
        slideView.cache = cache
        slideView.tabbar = tabbar
        slideView.baseViewController = self
        slideView.setup()
        slideView.delegate = self
        slideView.selectedIndex = self.index!
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var cache_: DLLRUCache?
    fileprivate var tabbar_: DLScrollTabbarView?
    fileprivate var slideView_: DLCustomSlideView?
    
    fileprivate var proType: productType?
    fileprivate var index: Int?
//    fileprivate var productID: Int?
}

// MARK: - Getters and Setters
extension ProductController {
    fileprivate var cache: DLLRUCache {
        if cache_ == nil {
            cache_ = DLLRUCache(count: 4)
            
            return cache_!
        }
        
        return cache_!
    }
    
    fileprivate var tabbar: DLScrollTabbarView {
        if tabbar_ == nil {
            tabbar_ = DLScrollTabbarView(frame: CGRect(x: 0, y: 0, width: Size.screenWidth, height: CGFloat(35)))
            tabbar_?.tabItemNormalColor = Color.hex7a7e89
            tabbar_?.tabItemSelectedColor = Color.hex19bbff
            tabbar_?.tabItemNormalFontSize = CGFloat(14)
            tabbar_?.trackColor = Color.hex19bbff
            tabbar_?.backgroundColor = Color.hexwhite
            
            return tabbar_!
        }
        
        return tabbar_!
    }
    
    fileprivate var slideView: DLCustomSlideView {
        if slideView_ == nil {
            slideView_ = DLCustomSlideView()
            slideView_?.backgroundColor = Color.hexf5f6f8
            
            return slideView_!
        }
        
        return slideView_!
    }
}

// MARK: - SlideView Delegate
extension ProductController: DLCustomSlideViewDelegate {
    func numberOfTabs(in sender: DLCustomSlideView!) -> Int {
        return 4
    }
    
    func dlCustomSlideView(_ sender: DLCustomSlideView!, controllerAt index: Int) -> UIViewController! {
        switch index {
        case 0:
            let deviceVC = ProductDeviceController(protocolType: proType!)
            return deviceVC
            
        case 1:
            if proType == productType.privateProduct {
                let ceshiData = [
                    ["调试", "错误", "告警", "错误", "信息", "调试", "保留"],
                    ["12:34", "08:35", "昨天", "2016/10/25", "2016/10/14", "2016/10/12", "2016/10/05"]
                    ]
                let eventVC = ProductEventAndSensorController(eventAndSensorInfo: ceshiData, isEvent: true)
                return eventVC
            } else {
                let ceshiData = ["模板应用", "独立应用"]
                let appVC = ProductAppAndDataController(appAndDataInfo: ceshiData, publicType: .normal)
                return appVC
            }
            
        case 2:
            if proType == productType.privateProduct {
                let ceshiData = [
                    ["007", "006", "005", "004", "003", "002", "001"],
                    ["12:34", "09:53", "昨天", "昨天", "昨天", "2016/10/12", "2016/10/05"]
                ]
                let sensorVC = ProductEventAndSensorController(eventAndSensorInfo: ceshiData, isEvent: false)
                return sensorVC
            } else {
                let ceshiData = ["数据流名称", "数据流名称", "数据流名称"]
                let dataVC = ProductAppAndDataController(appAndDataInfo: ceshiData, publicType: .data)
                return dataVC
            }
            
        case 3:
            if proType == productType.privateProduct {
                let teamVC = ProductTeamController()
                return teamVC
            } else {
                let triggerVC = ProductTriggerController()
                return triggerVC
            }
            
        default:
            return nil
        }
    }
}
