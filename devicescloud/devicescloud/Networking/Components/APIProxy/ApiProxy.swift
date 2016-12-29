//
//  ApiProxy.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation
import Alamofire

typealias ApiCallback = (ONTURLResponse) -> ()

class ApiProxy {
    
    var dispathcTable: [Int: URLSessionTask]
    
    //MARK: - life cycle
    static let sharedInstance = ApiProxy()
    
    private init() {
        dispathcTable = [Int: URLSessionTask]()
    }
    
    //MARK: - public methods
    func callGETWithParams(params: ParamData, serviceId: String, methodName: String, success: @escaping ApiCallback, fail: @escaping ApiCallback) -> Int {
        let request = RequestGenerator.sharedInstance.generateGETRequestWithServiceId(serviceId: serviceId, requestParams: params, methodName: methodName)
        let requestId = callApiWithRequest(request: request, success: success, fail: fail)
        
        return requestId
    }
    
    func callPOSTWithParams(params: ParamData, serviceId: String, methodName: String, success: @escaping ApiCallback, fail: @escaping ApiCallback) -> Int {
        let request = RequestGenerator.sharedInstance.generatePOSTRequestWithServiceId(serviceId: serviceId, requestParams: params, methodName: methodName)
        let requestId = callApiWithRequest(request: request, success: success, fail: fail)
        
        return requestId
    }
    
    func cancelRequestWithRequestId(requestId: Int) {
        let requestOperation = dispathcTable[requestId]
        requestOperation?.cancel()
        dispathcTable.removeValue(forKey: requestId)
    }
    
    func cancelRequestWithRequestIdList(requestIdList: [Int]) {
        for requestId in requestIdList {
            cancelRequestWithRequestId(requestId: requestId)
        }
    }
    
    //MARK: - private methods
    private func callApiWithRequest(request: URLRequest, success: @escaping ApiCallback, fail: @escaping ApiCallback) -> Int {
        var task: URLSessionTask? = nil
        task = Alamofire.request(request).responseJSON { response in
            let id = task!.taskIdentifier
            self.dispathcTable.removeValue(forKey: id)
            let responseData = response.data
            let responseString = String(data: responseData!, encoding: String.Encoding.utf8)
            
            switch response.result {
            case .success:
                let urlResponse = ONTURLResponse(withResponseString: responseString!, requestId: id, request: request, responseData: responseData! as NSData, status: ONTURLResponseStatus.Success)
                success(urlResponse)
                
            case .failure(let error):
                let urlResponse = ONTURLResponse(withResponseString: responseString!, requestId: id, request: request, responseData: responseData! as NSData, error: error as NSError)
                fail(urlResponse)
            }
        }.task
        
        let requestId = task!.taskIdentifier
        
        return requestId
    }
}
