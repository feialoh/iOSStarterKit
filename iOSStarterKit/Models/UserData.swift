//
//  UserData.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/17/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import Foundation

class UserData {
    
    var authToken : String!
    var deviceId : String!
    
    //User Data
    var userName : String!
    var userId : String!
    var userEmail : String!
    var userCountryType : String!
    var userType : String!
    var alreadyLogIn:String!
    
    static let sharedData = UserData()
    
    init() {
        //        print("initiated")
    }
    
    func saveUserData (_ user : [String:String]) {
        userName = user["name"]
        userEmail = user["email"]
        userId = user["userId"]
        userCountryType = user["countryType"]
        userType = user["userType"]
        alreadyLogIn = user["alreadyLoggedIn"]
        authToken = DefaultWrapper.authtoken()
        deviceId = DefaultWrapper.deviceId()
        
        //        authToken = Utilities.getDefaultValue(AUTH_TOKEN) as! String
        //        deviceId = Utilities.getDefaultValue(DEVICEID) as! String
    }
    
}

