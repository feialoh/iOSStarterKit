//
//  DefaultWrapper.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import UIKit

class DefaultWrapper: NSObject {
    
    class func deviceId() -> String{
        let id = UserDefaults.standard.value(forKey:Constants.AppKeys.deviceId) as? String
        let deviceId = id ?? ""
        return deviceId
    }
    
    class func saveDeviceId(_ deviceId: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(deviceId, forKey: Constants.AppKeys.deviceId)
    }
    
    class func authtoken() -> String?{
        let authToken = UserDefaults.standard.value(forKey: Constants.AppKeys.authToken) as? String
        return authToken
    }
    
    class func saveAuthToken(_ authToken: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(authToken, forKey: Constants.AppKeys.authToken)
    }
    
    class func deviceToken() -> String?{
        let deviceToken = UserDefaults.standard.value(forKey: Constants.AppKeys.deviceToken) as? String
        return deviceToken
    }
    
    class func saveDeviceToken(_ deviceToken: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(deviceToken, forKey: Constants.AppKeys.deviceToken)
    }
    
    class func userData() -> [String: String]?{
        let userData = UserDefaults.standard.value(forKey: Constants.AppKeys.userData) as? [String: String]
        return userData
    }
    
    class func saveUserData(_ data: [String: String]){
        let userDefaults = UserDefaults.standard
        userDefaults.set(data, forKey: Constants.AppKeys.userData)
    }
    
    class func saveFirstTimeStatus(status: Bool, userId: String){
        let userDefaults = UserDefaults.standard
        userDefaults.set(status, forKey: userId+Constants.AppKeys.firstTimeLogin)
    }
    
    class func firstTimeStatus(userId: String) -> Bool?{
        let key = userId+Constants.AppKeys.firstTimeLogin
        let firstTime = UserDefaults.standard.value(forKey: key) as? Bool
        return firstTime
    }
    

}

