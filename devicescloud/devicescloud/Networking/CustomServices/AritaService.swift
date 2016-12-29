//
//  AritaService.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

class AritaService: Service, ServiceProtocol {
    
    //MARK: - ServiceProtocol
    func onlineApiBaseUrl() -> String {
        
        return "http://app.arita.cc/"
        
    }
    
    func onlineApiVersion() -> String {
        
        return ""
    }
    
    func onlineApiCommonPath() -> String {
        
        return "ios"
    }
}
