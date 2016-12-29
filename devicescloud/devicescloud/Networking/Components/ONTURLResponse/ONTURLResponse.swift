//
//  URLResponse.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

class ONTURLResponse {
    
    let status: ONTURLResponseStatus
    let contentString: String
    let requestId: Int
    let request: URLRequest
    let responseData: NSData
    
    init(withResponseString responseString: String, requestId: Int, request: URLRequest, responseData: NSData, status: ONTURLResponseStatus) {
        self.contentString = responseString
        self.status = status
        self.requestId = requestId
        self.responseData = responseData
        self.request = request
    }
    
    init(withResponseString responseString: String, requestId: Int, request: URLRequest, responseData: NSData, error: NSError) {
        self.contentString = responseString
        self.requestId = requestId
        self.responseData = responseData
        self.request = request
        
        if error.code == NSURLErrorTimedOut {
            self.status = ONTURLResponseStatus.ErrorTimeout
        } else {
            self.status = ONTURLResponseStatus.ErrorNoNetwork
        }
    }
}
