//
//  AppContext.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation
import Alamofire

class AppContext {
    
    //MARK: - life cycle
    static let sharedInstance = AppContext()
    
    private let networkReachabilityManager: NetworkReachabilityManager
    
    private init() {
        let host = ServiceFactory.sharedInstance.serviceWithId(id: ServiceNameList.oneapp).apiBaseUrl
        networkReachabilityManager = NetworkReachabilityManager(host: host)!
    }
    
    func isReachable() -> Bool {
        return networkReachabilityManager.isReachable
    }
    
    func getAPPVersion() -> String {
        return Bundle.main.infoDictionary!["CFBundleVersion"] as! String
    }
    
    func getOS() -> String {
        return UIDevice.current.systemName + " " + UIDevice.current.systemVersion
    }
    
    func getDevModel() -> String {
        return UIDevice.current.model
    }
    
    func getUUID() -> String {
        return UIDevice.current.identifierForVendor!.uuidString
    }
}
