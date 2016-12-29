//
//  AuthManager.swift
//  devicescloud
//
//  Created by 潘东 on 2016/12/19.
//  Copyright © 2016年 com.onenet.app. All rights reserved.
//

import Foundation

struct AuthData {
    
    private let kToken = "token"
    private let kSession = "session"
    
    var token: String
    var session: String
    
    init(token: String, session: String) {
        self.token = token
        self.session = session
    }
    
    init(data: [String: AnyObject]) {
        self.token = data[kToken] as! String
        self.session = data[kSession] as! String
    }
    
    func toDictionary() -> [String: String] {
        let dic = [
            kToken: token,
            kSession: session
        ]
        
        return dic
    }
}

class AuthManager {
    
    private let kAuthData = "AuthData"
    
    //MARK: - life cycle
    static let sharedInstance = AuthManager()
    
    private var authData: AuthData?
    
    private init() {
        if let data = UserDefaults.standard.object(forKey: kAuthData) {
            authData = AuthData(data: data as! [String : AnyObject])
        } else {
            authData = nil
        }
    }
    
    //MARK: - public method
    func setAuthData(data: AuthData) {
        authData = data
        saveToLocal()
    }
    
    func getAuthData() -> AuthData? {
        return authData
    }
    
    func deleteAuth() {
        deleteLocalData()
        authData = nil
    }
    
    //MARK: - private method
    private func saveToLocal() {
        UserDefaults.standard.set(authData!.toDictionary(), forKey: kAuthData)
        UserDefaults.standard.synchronize()
    }
    
    private func deleteLocalData() {
        UserDefaults.standard.removeObject(forKey: kAuthData)
        UserDefaults.standard.synchronize()
    }
}
