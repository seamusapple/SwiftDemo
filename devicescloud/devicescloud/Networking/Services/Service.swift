//
//  Service.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

protocol ServiceProtocol: class {
    
    func onlineApiBaseUrl() -> String
    func onlineApiVersion() -> String
    func onlineApiCommonPath() -> String
}

class Service {
    
    weak var child: ServiceProtocol?
    
    init() {
        if let aChild = self as? ServiceProtocol {
            child = aChild
        }
    }
    
    //MARK: - getters and setters
    var apiBaseUrl: String {
        get {
            return (child?.onlineApiBaseUrl())!
        }
    }
    
    var apiVersion: String {
        get {
            return (child?.onlineApiVersion())!
        }
    }
    
    var apiCommonPath: String {
        get {
            return (child?.onlineApiCommonPath())!
        }
    }
}
