//
//  ProductDeviceDetailHomeController.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/15.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import UIKit
enum publicType {
    case data
    case common
    case indepent
    case normal
}

class ProductDeviceDetailHomeController: BaseController {

    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBar()
        addPageViews()
        layoutPageViews()
        setPageViews()
    }
    
    // MARK: - Init Methods
    //测试
    init(index: Int, protocolType: productType) {
        super.init(nibName: nil, bundle: nil)
        
        self.index = index
        self.proType = protocolType
        self.tabBarCount = (TextStr.productDeviceSegmentTitle[(proType?.rawValue)!]?.count)!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Controller Settings
    private func setNavigationBar() {
        setNaviBar(type: .normal)
        setNaviBar(title: TextStr.deviceDetail)
    }
    
    private func addPageViews() {
        view.addSubview(deviceView)
        view.addSubview(slideView)
    }
    
    private func layoutPageViews() {
        deviceView.snp.makeConstraints { (ConstraintMaker) in
            let height = CGFloat(80)
            
            ConstraintMaker.left.right.top.equalTo(view)
            ConstraintMaker.bottom.equalTo(slideView.snp.top)
            ConstraintMaker.height.equalTo(height)
        }
        slideView.snp.makeConstraints { (ConstraintMaker) in
            ConstraintMaker.left.right.bottom.equalTo(view)
            ConstraintMaker.top.equalTo(deviceView.snp.bottom)
        }
    }
    
    private func setPageViews() {
        var itemArray = [DLScrollTabbarItem]()
        for str in TextStr.productDeviceSegmentTitle[(proType?.rawValue)!]! {
            itemArray.append(DLScrollTabbarItem(title: str, width: (Size.screenWidth / CGFloat(tabBarCount!))))
        }
        
        tabbar.tabbarItems = itemArray
        slideView.cache = cache
        slideView.tabbar = tabbar
        slideView.baseViewController = self
        slideView.setup()
        slideView.delegate = self
        slideView.selectedIndex = self.index!
        
        deviceView.deviceLogo.image = UIImage(named: "img_03")
        deviceView.deviceName.text = "设备名称"
    }
    
    // MARK: - Event Responses
    
    // MARK: - Private Methods
    
    // MARK: - Controller Attributes
    fileprivate var cache_: DLLRUCache?
    fileprivate var tabbar_: DLScrollTabbarView?
    fileprivate var slideView_: DLCustomSlideView?
    fileprivate var deviceView_: ProductDeviceHomeTopView?

    fileprivate var proType: productType?
    fileprivate var index: Int?
    fileprivate var tabBarCount: Int?
}

// MARK: - Getters and Setters
extension ProductDeviceDetailHomeController {
    fileprivate var cache: DLLRUCache {
        if cache_ == nil {
            cache_ = DLLRUCache(count: tabBarCount!)
            
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
    
    fileprivate var deviceView: ProductDeviceHomeTopView {
        if deviceView_ == nil {
            deviceView_ = ProductDeviceHomeTopView()
            
            return deviceView_!
        }
        
        return deviceView_!
    }
}

// MARK: - SlideView Delegate
extension ProductDeviceDetailHomeController: DLCustomSlideViewDelegate {
    func numberOfTabs(in sender: DLCustomSlideView!) -> Int {
        return tabBarCount!
    }
    
    func dlCustomSlideView(_ sender: DLCustomSlideView!, controllerAt index: Int) -> UIViewController! {
        switch index {
        case 0:
            if proType == productType.privateProduct {
                let deviceInfoVC = PrivateDeviceInfoController()
                return deviceInfoVC
            } else {
                let deviceInfoVC = PublicDeviceInfoController()
                return deviceInfoVC
            }
            
        case 1:
            if proType == productType.privateProduct {
                let ceshiData = [
                    ["调试", "错误", "告警", "错误", "信息", "调试", "保留"],
                    ["12:34", "08:35", "昨天", "2016/10/25", "2016/10/14", "2016/10/12", "2016/10/05"]
                ]
                let eventVC = ProductEventAndSensorController(eventAndSensorInfo: ceshiData, isEvent: true)
                return eventVC
            } else {
                let ceshiData = ["应用名称", "应用名称", "应用名称"]
                let appVC = ProductAppAndDataController(appAndDataInfo: ceshiData, publicType: .common)
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
                let ceshiData = ["应用名称", "应用名称", "应用名称"]
                let dataVC = ProductAppAndDataController(appAndDataInfo: ceshiData, publicType: .indepent)
                return dataVC
            }
            
        case 3:
            if proType == productType.privateProduct {
                return nil
            } else {
                let ceshiData = ["数据流名称", "数据流名称", "数据流名称"]
                let dataVC = ProductAppAndDataController(appAndDataInfo: ceshiData, publicType: .data)
                    return dataVC
            }
            
        default:
            return nil
        }
    }
}
