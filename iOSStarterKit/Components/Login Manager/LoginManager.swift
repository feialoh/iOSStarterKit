//
//  LoginManager.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import UIKit

class LoginManager: NSObject {
    
    func forgotPassword(email: String, completion: @escaping (_ response: [String: Any]?, _ error: Error?) -> ()){
        
        var dict = [String: String]()
        dict["authtoken"] = DefaultWrapper.authtoken()
        dict["deviceid"] = DefaultWrapper.deviceId()
        dict["email"] = email
        
        let urlRequest = APIManager.urlRequest(endpoint: Constants.API.forgotPassword, requestDict: dict, method: .post)
        
        guard let request = urlRequest else {
            completion(nil, APIError.invalidRequest)
            return
        }
        
        APIManager.executeTask(request: request) { (response, error) in
            
            if let error = error{
                completion(nil, error)
                return
            }
            guard let response = response, let responseDict = response["response"] as? [String: Any] else {
                completion(nil, APIError.invalidResponse)
                return
            }
            if let text = responseDict["text"] as? String{
                completion(nil, APIError.customError(text))
                return
            }
            completion(responseDict, nil)
        }
    }
    
    func login(username: String, password: String, completion: @escaping (_ user: User?, _ error: Error?) -> ()){
        
        var dict = [String: String]()
        dict["deviceid"] = DefaultWrapper.deviceId()
        dict["authtoken"] = DefaultWrapper.authtoken()
        dict["userName"] = username
        dict["password"] = password
        dict["type"] = "chat"
        
        let urlRequest = APIManager.urlRequest(endpoint: Constants.API.login, requestDict: dict, method: .post)
        
        guard let request = urlRequest else {
            completion(nil, APIError.invalidRequest)
            return
        }
        
        APIManager.executeTask(request: request) { (response, error) in
            if let error = error{
                completion(nil, error)
                return
            }
            guard let response = response, let responseDict = response["response"] as? [String: Any] else {
                completion(nil, APIError.invalidResponse)
                return
            }
            if let text = responseDict["text"] as? String{
                completion(nil, APIError.customError(text))
                return
            }
            guard let userData = response["details"] as? [String: String] else {
                completion(nil, APIError.invalidResponse)
                return
            }
            guard let id = userData["userId"], let name = userData["name"], let userType = userData["userType"], let country = userData["countryType"], let email = userData["email"], let loginStatus = userData["alreadyLoggedIn"] else {
                completion(nil, APIError.invalidResponse)
                return
            }
            let user = User(userId: id, name: name, country: country, email: email, userType: userType, alreadyLoggedIn: loginStatus)
            
            completion(user, nil)
        }
        
    }
    
    func saveUserData(_ data: User) {
        
        var dict = [String: String]()
        dict["userId"] = data.userId
        dict["name"] = data.name
        dict["email"] = data.email
        dict["userType"] = data.userType
        dict["country"] = data.country
        dict["alreadyLoggedIn"] = "no"
        
        DefaultWrapper.saveUserData(dict)
        UserData.sharedData.saveUserData(dict)
        
        if DefaultWrapper.firstTimeStatus(userId: data.userId) == nil{
            DefaultWrapper.saveFirstTimeStatus(status: true, userId: data.userId)
        }
    }
}
