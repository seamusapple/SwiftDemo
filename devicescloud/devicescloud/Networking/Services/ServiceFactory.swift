//
//  ServiceFactory.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

struct ServiceNameList {
    
    static let oneapp = "ServiceOneAPP"
    static let arita = "ServiceArita"
    static let onenet = "ServiceOneNet"
}

class ServiceFactory {
    
    //MARK: - life cycle
    static let sharedInstance = ServiceFactory()
    
    var serviceStorage: [String: Service]
    
    private init() {
        serviceStorage = [String: Service]()
    }
    
    //MARK: - public methods
    func serviceWithId(id: String) -> Service {
        if serviceStorage[id] == nil {
            if let newService = newServiceWithId(id: id) {
                 serviceStorage[id] = newService
            }
        }
        
        return serviceStorage[id]!
    }
    
    //MARK: - private methods
    private func newServiceWithId(id: String) -> Service? {
        if id == ServiceNameList.oneapp {
            return OneAPPService()
        } else if id == ServiceNameList.arita {
            return AritaService()
        } else if id == ServiceNameList.onenet {
            return OneNetService()
        }
        
        return nil
    }
}
