//
//  TextConst.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/1.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

/**
 *
 *  用于放置所有文字相关的常量
 *
 */

struct TextStr {
    
    // MARK: - TabBar Text
    static let product = "产品"
    static let discovery = "发现"
    static let notification = "通知"
    static let more = "更多"
    
    // MARK: - Navi Text
    static let searchProductTitle = "搜索产品"
    static let searchNotificationTitle = "搜索消息"
    static let searchApplicationTitle = "搜索应用"
    static let searchCancle = "取消"
    
    // MARK: - Product Text
    static let productHomeNonLogin = "你还没有登录"
    static let productHomePleaseLogin = "更多信息请登录后查看！"
    static let login = "登录"
    static let productDetail = "详情"
    static let productTitle = "产品名称"
    static let productDevice = "设备"
    static let productApplication = "应用"
    static let productData = "数据"
    static let productTriger = "触发器"
    static let productEvent = "事件"
    static let productSensor = "传感器"
    static let productTeam = "团队"
    static let productDetailTitle = "产品详情"
    static let productSegmentTitle = [
        "public": ["设备", "应用", "数据流", "触发器"],
        "private": ["设备", "事件", "传感器", "团队"]
    ]
    static let productDeviceSegmentTitle = [
        "public": ["设备资料", "模板应用", "独立应用", "数据流"],
        "private": ["设备资料", "设备事件", "传感器数据"]
    ]
    static let deviceDetail = "设备详情"
    static let eventDetail = "事件详情"
    static let sensorDetail = "传感器详情"
    static let appListTitle = ["模板应用", "独立应用"]
    static let appDetail = "应用详情"
    static let dataDetail = "数据流名称"
    
    // MARK: - Discovery text
    static let cancle = "取消"
    static let shareQQ = "QQ好友"
    static let shareWechat = "微信好友"
    static let shareFriends = "朋友圈"
    static let shareCopy = "复制链接"
    static let shareQzone = "QQ空间"
    static let shareWeibo = "新浪微博"
    static let writeComment = "写评论..."
    static let publishComment = "发表评论"
    static let publish = "发表"
    
}
