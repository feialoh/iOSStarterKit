//
//  APIManager.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import Foundation
import Alamofire


enum APIError: Error{
    case invalidRequest
    case noInternet
    case invalidResponse
    case customError(String)
}

extension APIError: LocalizedError{
    
    public var errorDescription: String?{
        
        switch self {
            
        case .invalidRequest:
            return "Invalid request"
            
        case .invalidResponse:
            return "Invalid response from server"
            
        case .noInternet:
            return "No internet. Please check your connection and try again"
            
        case .customError(let message):
            return message
            
        }
    }
}


class APIManager{
    
    
    //Create URL Request
    class func urlRequest(endpoint: String, requestDict: [String : Any]?, method: HTTPMethod, headerDict: [String : Any] = [:]) -> URLRequest?{
        
        // Concatenate the Base URL and the API end point
        let requestURLString = "\(Constants.AppKeys.BASE_URL)\(endpoint)"
        
        // Create the URL from the url string created.
        guard let url = URL(string: requestURLString) else { return nil }
        
        // Construct the URLRequest object
        var request = URLRequest(url: url)
        
        // Set the HTTP Method
        request.httpMethod = method.rawValue
        
        do {
            if method == .post {
                
                // Create a JSONData from the request parameters
                guard let requestDict =  requestDict else {
                    return nil
                }
                
                let jsonData: Data = try JSONSerialization.data(withJSONObject: requestDict, options: JSONSerialization.WritingOptions.prettyPrinted)
                
                // Set the Request body
                request.httpBody = jsonData
            }
            
            // Set the request headers
            
            for key in headerDict.keys {
                request.setValue(headerDict[key] as? String, forHTTPHeaderField: key)
            }
            
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            
            // Set the time interval
            request.timeoutInterval = TimeInterval(180)
            
            // Return the URLRequest object created.
            Logger.log("Request : \(String(data: request.httpBody!, encoding: .utf8) ?? "nil"), Request Url: \(String(describing: request.url))")
            
            return request
        }catch let error{
            print(error.localizedDescription)
        }
        
        return nil
    }
    
    
    //Perform a API Call
    class func executeTask(request: URLRequest, completion: @escaping (_ response: [String: Any]?, _ error: Error?)->()) {
        
        guard isConnectedToInternet() else {
            completion(nil, APIError.noInternet)
            return
        }
        //        Logger.log("Request Data: \(String(data: request.httpBody!, encoding: .utf8) ?? "nil"), Request Url: \(String(describing: request.url))")
        
        Alamofire.request(request).responseJSON { (response) in
            
            guard response.result.isSuccess else {
                completion(nil, response.error)
                return
            }
            
            guard let responseJSON = response.result.value as? [String : Any] else {
                completion(nil, response.error)
                return
            }
            
            completion(responseJSON, nil)
        }
    }
    
//    class func uploadFile(file: Data, params: [String: String], _ completion: @escaping (DataResponse<Data, APIError>) -> ()) {
//        
//        guard isConnectedToInternet() else {
//            completion(.Failure(APIError.noInternet))
//            return
//        }
//        
//        Alamofire.upload(multipartFormData: { (multipartFormData) in
//            for (key, value) in params {
//                multipartFormData.append(value.data(using: String.Encoding.utf8)!, withName: key)
//            }
//            multipartFormData.append(file, withName: "files", fileName: "image.png", mimeType: "image/png")
//            
//        }, to: Constants.AppKeys.BASE_URL+Constants.API.imageUpload) { (encodingResult) in
//            
//            switch encodingResult{
//                
//            case .failure(let encodingError):
//                return completion(.Failure(APIError.customError(encodingError.localizedDescription)))
//                
//            case .success(let upload, _, _):
//                upload.uploadProgress { progress in
//                    print(progress)
//                }
//                
//                upload.validate()
//                upload.responseData(completionHandler: { (result) in
//                    guard let data = result.data else {
//                        completion(.Failure(APIError.invalidResponse))
//                        return
//                    }
//                    completion(.Success(data))
//                })
//            }
//        }
//    }
    
    //Check for network connection
    class func isConnectedToInternet() -> Bool{
        return NetworkReachabilityManager()!.isReachable
    }
    
    
}

