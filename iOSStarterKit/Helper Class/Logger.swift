//
//  Logger.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import Foundation

class Logger {
    
    class func log(_ message: Any, file: String = #file, function: String = #function){
        
        print("=================")
        print("File: ", file.components(separatedBy: "/").last ?? "")
        print("Function: ", function)
        print("Message: ", message)
        print("=================")
    }
}
