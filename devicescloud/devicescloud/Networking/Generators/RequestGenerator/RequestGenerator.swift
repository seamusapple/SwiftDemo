//
//  RequestGenerator.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation
import Alamofire

class RequestGenerator {
    
    //MARK: - life cycle
    static let sharedInstance = RequestGenerator()
    
    private init() {}
    
    //MARK: - public func
    func generateGETRequestWithServiceId(serviceId: String, requestParams: ParamData, methodName: String) -> URLRequest {
        let service = ServiceFactory.sharedInstance.serviceWithId(id: serviceId)
        var urlString: String
        if service.apiVersion.characters.count != 0 {
            urlString = service.apiBaseUrl + "/" + service.apiCommonPath + "/" + service.apiVersion + "/" + methodName
        } else {
            urlString = service.apiBaseUrl + "/" + service.apiCommonPath + "/" + methodName
        }
        
        let URL = NSURL(string: urlString)!
        var request = URLRequest(url: URL as URL)
        request.httpMethod = "GET"
        let encoding = Alamofire.URLEncoding.default
        do {
            try request = encoding.encode(request, with: requestParams)
        } catch { }
        
        let appContext = AppContext.sharedInstance
        let iotext = [
            "app_version": appContext.getAPPVersion(),
            "os": appContext.getOS(),
            "model": appContext.getDevModel(),
            "uuid": appContext.getUUID()
        ]
        do {
            let iotextData = try JSONSerialization.data(withJSONObject: iotext, options: JSONSerialization.WritingOptions(rawValue: 0))
            let iotextString = String(data: iotextData, encoding: String.Encoding.utf8)
            request.setValue(iotextString, forHTTPHeaderField: "iotext")
        } catch { }
        
        if let auth = AuthManager.sharedInstance.getAuthData() {
            request.setValue(auth.token, forHTTPHeaderField: "token")
        }
        
        return request
    }
    
    func generatePOSTRequestWithServiceId(serviceId: String, requestParams: ParamData, methodName: String) -> URLRequest {
        let service = ServiceFactory.sharedInstance.serviceWithId(id: serviceId)
        var urlString: String
        if service.apiVersion.characters.count != 0 {
            urlString = service.apiBaseUrl + "/" + service.apiCommonPath + "/" + service.apiVersion + "/" + methodName
        } else {
            urlString = service.apiBaseUrl + "/" + service.apiCommonPath + "/" + methodName
        }
        
        let URL = NSURL(string: urlString)!
        var request = URLRequest(url: URL as URL)
        request.httpMethod = "POST"
        let encoding = Alamofire.URLEncoding.default
        do {
            try request = encoding.encode(request, with: requestParams)
        } catch { }
        
        let appContext = AppContext.sharedInstance
        let iotext = [
            "app_version": appContext.getAPPVersion(),
            "os": appContext.getOS(),
            "model": appContext.getDevModel(),
            "uuid": appContext.getUUID()
        ]
        do {
            let iotextData = try JSONSerialization.data(withJSONObject: iotext, options: JSONSerialization.WritingOptions(rawValue: 0))
            let iotextString = String(data: iotextData, encoding: String.Encoding.utf8)
            request.setValue(iotextString, forHTTPHeaderField: "iotext")
        } catch { }
        
        if let auth = AuthManager.sharedInstance.getAuthData() {
            request.setValue(auth.token, forHTTPHeaderField: "token")
        }
        
        return request
    }
}
