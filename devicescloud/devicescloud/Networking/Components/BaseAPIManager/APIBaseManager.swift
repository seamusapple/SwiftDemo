//
//  APIBaseManager.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

class APIBaseManager {
    
    // 由负责调用API接口的业务Controller实现
    weak var delegate: APIManagerCallBackDelegate?
    weak var paramSource: APIManagerParamSource?
    
    // 由SubAPIManager来实现
    weak var validator: APIManagerValidator?
    private weak var child: APIManager?
    
    var errorMessage: String?
    var errorType: APIManagerErrorType
    var response: ONTURLResponse?
    
    var isLoading: Bool
    
    private var fetchedRawData: NSData?
    private var _requestIdList: [Int]?
    
    init() {
        delegate = nil
        paramSource = nil
        validator = nil
        
        isLoading = false
        
        errorMessage = nil
        errorType = .Default
        
        if let aChild = self as? APIManager {
            child = aChild
        } else {
            //TODO: 抛出异常
            return
        }
    }
    
    deinit {
        cancelAllRequests()
        _requestIdList = nil
        
    }
    
    //MARK: - public methods
    func cancelAllRequests() {
        ApiProxy.sharedInstance.cancelRequestWithRequestIdList(requestIdList: requestIdList)
        requestIdList.removeAll()
    }
    
    func cancelRequestWithRequestId(requestId: Int) {
        if removeRequestIdWithRequestId(requestId: requestId) {
            ApiProxy.sharedInstance.cancelRequestWithRequestId(requestId: requestId)
        }
    }
    
    func fetchDataWithReformer(reformer: APIManagerDataReformer?) -> AnyObject {
        var resultData: AnyObject
        
        if let myReformer = reformer {
            resultData = myReformer.manager(manager: self, reformData: fetchedRawData!)
        } else {
            resultData = fetchedRawData!
        }
        
        return resultData
    }
    
    //MARK: - calling api
    func loadData() -> Int {
        let params = paramSource?.paramsForApi(manager: self)
        let requestId = loadDataWithParams(params: params!)
        
        return requestId
    }
    
    private func loadDataWithParams(params: ParamData) -> Int {
        var requestId = 0
        
        let apiParams = reformParams(params: params)
        if shouldCallAPIWithParams(params: apiParams) {
            if validator!.manager(manager: self, isCorrectWithParamsData: apiParams) {
                
                if isReachable {
                    isLoading = true
                    switch child!.requestType() {
                    case .Get:
                        requestId = callAPI(requeseType: .Get, withParam: apiParams)
                        
                    case .Post:
                        requestId = callAPI(requeseType: .Post, withParam: apiParams)
                    }
                    
                    return requestId
                } else {
                    failedOnCallingApi(response: nil, withErrorType: .NoNetWork)
                    
                    return requestId
                }
            } else {
                failedOnCallingApi(response: nil, withErrorType: .ParamsError)
                
                return requestId
            }
        }
        return requestId
    }
    
    //MARK: - api callbacks
    private func successedOnCallingApi(response: ONTURLResponse) {
        isLoading = false
        self.response = response
        fetchedRawData = response.responseData
        
        let _ = removeRequestIdWithRequestId(requestId: response.requestId)
        if validator!.manager(manager: self, isCorrectWithCallBackData: response.responseData) {
            if beforePerformSuccessWithResponse(response: response) {
                delegate!.managerCallAPIDidSuccess(manager: self)
            }
            afterPerformSuccessWithResponse(response: response)
        } else {
            failedOnCallingApi(response: response, withErrorType: APIManagerErrorType.NoContent)
        }
    }
    
    //TODO: 处理多种错误类型
    private func failedOnCallingApi(response: ONTURLResponse?, withErrorType errorType: APIManagerErrorType) {
        isLoading = false
        self.response = response
        self.errorType = errorType
        if let hasResponse = response {
            let _ = removeRequestIdWithRequestId(requestId: hasResponse.requestId)
            if beforePerformFailWithResponse(response: hasResponse) {
                delegate?.managerCallAPIDidFailed(manager: self)
            }
            afterPerformFailWithResponse(response: hasResponse)
        }
    }
    
    //MARK: - method for interceptor
    func beforePerformSuccessWithResponse(response: ONTURLResponse) -> Bool {
        return true
    }
    
    func afterPerformSuccessWithResponse(response: ONTURLResponse) {
        
    }
    
    func beforePerformFailWithResponse(response: ONTURLResponse) -> Bool {
        return true
    }
    
    func afterPerformFailWithResponse(response: ONTURLResponse) {
        
    }
    
    func shouldCallAPIWithParams(params: ParamData) -> Bool {
        return true
    }
    
    func afterCallingAPIWithParams(params: ParamData) {
        
    }
    
    
    //MARK: - method for child
    func reformParams(params: ParamData) -> ParamData {
        return params
    }
    
    //MARK: - private methods
    private func removeRequestIdWithRequestId(requestId: Int) -> Bool {
        var isRemoved = false
        
        var indexToRemove: Int?
        for index in 0 ..< requestIdList.count  {
            if requestIdList[index] == requestId {
                indexToRemove = index
            }
        }
        if let rmIndex = indexToRemove {
            requestIdList.remove(at: rmIndex)
            isRemoved = true
        }
        
        return isRemoved
    }
    
    private func callAPI(requeseType: APIManagerRequestType, withParam param: ParamData) -> Int {
        var requestId = 0
        switch requeseType {
        case .Get:
            requestId = ApiProxy.sharedInstance.callGETWithParams(
                params: param,
                serviceId: child!.serviceType(),
                methodName: child!.methodName(),
                success: { [weak self]
                    response in
                    self?.successedOnCallingApi(response: response)
                },
                fail: { [weak self]
                    response in
                    self?.failedOnCallingApi(response: response, withErrorType: .Default)
                })
            
        case .Post:
            requestId = ApiProxy.sharedInstance.callPOSTWithParams(
                params: param,
                serviceId: child!.serviceType(),
                methodName: child!.methodName(),
                success: { [weak self]
                    response in
                    self?.successedOnCallingApi(response: response)
                },
                fail: { [weak self]
                    response in
                    self?.failedOnCallingApi(response: response, withErrorType: .Default)
                })
        }
        requestIdList.append(requestId)
        
        return requestId
    }
    
    //MARK: - getters and setters
    var requestIdList: [Int] {
        get {
            if _requestIdList == nil {
                _requestIdList = [Int]()
            }
            
            return _requestIdList!
        }
        
        set {}
    }
    
    var isReachable: Bool {
        get {
            let isReachability = AppContext.sharedInstance.isReachable()
            if !isReachability {
                errorType = APIManagerErrorType.NoNetWork
            }
            return isReachability
        }
    }
}
