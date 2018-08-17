//
//  ApplicationManager.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/17/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//


import Foundation

class ApplicationManager: NSObject {
    
    static let shared = ApplicationManager()
    
    public let loginManager: LoginManager
    
    private override init() {
        loginManager = LoginManager()
    }
    
    
    func initializeApp(completion: @escaping (_ response: [String: Any]?, _ error: Error?)->()) {
        
        var dict = [String: String]()
        dict["deviceid"] = DefaultWrapper.deviceId()
        dict["type"] = "chat"
        
        let urlRequest = APIManager.urlRequest(endpoint: Constants.API.initializeApp, requestDict: dict, method: .post)
        
        guard let request = urlRequest else {
            completion(nil, APIError.invalidRequest)
            return
        }
        
        APIManager.executeTask(request: request) { (response, error) in
            completion(response, error)
        }
    }
    
    func updateDeviceToken() {
        
        var dict = [String: String]()
        
        dict["authtoken"] = DefaultWrapper.authtoken()
        dict["deviceid"] = DefaultWrapper.deviceId()
        dict["deviceToken"] = DefaultWrapper.deviceToken()
        dict["userId"] = ""
        if let userId = UserData.sharedData.userId{
            dict["userId"] = userId
        }
        dict["type"] = "chat"
        
        let urlRequest = APIManager.urlRequest(endpoint: Constants.API.updateDeviceToken, requestDict: dict, method: .post)
        
        guard let request = urlRequest else{
            print("update device token error: invalid request ", APIError.invalidRequest.localizedDescription)
            return
        }
        
        APIManager.executeTask(request: request) { (response, error) in
            if let error = error{
                print("updateDeviceToken error: ", error.localizedDescription)
            }
        }
        
    }
    
}

