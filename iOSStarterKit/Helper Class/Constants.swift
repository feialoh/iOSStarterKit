//
//  Constants.swift
//  iOSStarterProjectWithPods
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import UIKit


struct Constants {

/*===============================================================================*/
// MARK: APP Details and general keys
/*===============================================================================*/

    struct AppKeys {
        
        static let APP_TITLE  = "My Starter App"
        
        static let modelName = "myAppPhoneUserData"
        
        static let modelBundle = Bundle(identifier: "com.feialoh.iOSStarterKit")!
        
        static let authToken           = "authToken"
        static let userName            = "userName"
        static let userId              = "userId"
        static let userRole            = "userRole"
        static let userData            = "userData"
        static let deviceId            = "deviceId"
        static let deviceToken         = "deviceToken"
        static let logemOut            = "logoutAll"
        static let firstTimeLogin      = "firstTime"
        
        static let DEVICE_ID           = UIDevice.current.identifierForVendor!.uuidString
        
        static let DOWNLOAD_FOLDER     = "imageFolder"
        
        /*===============================================================================*/
        // MARK: API Communication
        /*===============================================================================*/
        
        static let BASE_URL = "<Your Url>"
        
        
        
        /*===============================================================================*/
        // MARK: Email Validation
        /*===============================================================================*/
        
        static let EMAIL_VALIDATION_CHARACTERS = "(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])"
        
    }

/*===============================================================================*/
// MARK: API End Points
/*===============================================================================*/

struct API {
    
    //INITIALIZE_API
    static let initializeApp = "webservices?procedure=initializeApp"
    //LOGIN_API
    static let login = "webservices?procedure=loginApp"
    //LOGOUT_API
    static let logout = "webservices?procedure=logout"
    //IMAGE_UPLOAD_API
    static let imageUpload = "webservices?procedure=uploadPhoto"
    //FORGOT_PASS
    static let forgotPassword = "webservices?procedure=forgotPassword"
    //UPDATE_DEVICE_TOKEN
    static let updateDeviceToken = "webservices?procedure=updateDeviceToken"
}


/*===============================================================================*/
// MARK: Storyboards
/*===============================================================================*/

struct Storyboards {
    static let main = "Main"
    static let login = "Login"
}


/*===============================================================================*/
// MARK: ViewControllerIds
/*===============================================================================*/

struct ViewControllerId {
    
    static let rootViewController = "RootViewController"
    static let mainTabBarController = "MainTabBarController"
    static let signInViewController = "SignInViewController"
}


/*===============================================================================*/
// MARK: CellIdentifiers for tableview/collectionview
/*===============================================================================*/

struct CellIdentifiers {
    static let userDetail = "userDetail"
}


/*===============================================================================*/
// MARK: NibIdentifiers
/*===============================================================================*/

struct NibIdentifiers {
    static let userDetail = "userDetail"
}


/*===============================================================================*/
// MARK: Alert messages
/*===============================================================================*/

struct AlertMessage {
    
    static let passwordSent = "Password has been sent to your email address"
    
    static let logOutText = "This user has been logged in to another device. You will be now logged out."
    
    static let logOutInitialText = "This user is already logged in on another device. Do you wish to logout from other devices and continue on this device?"
    
    static let noNetworkAlert = "The Internet connection appears to be offline."
}

/*===============================================================================*/
// MARK: Icon Images Names
/*===============================================================================*/

struct ImageIcon {

    static let homeButtonIcon                = "HomeButton"
    static let settingsButtonIcon            = "SettingsButton"
    static let backButtonIcon                = "BackButton"
    
}


/*===============================================================================*/
// MARK: Userdefaults Keys
/*===============================================================================*/

struct kUserDefaults {
    
    static let isSignIn = "isSignIn"
    
    
}



/*===============================================================================*/
// MARK: Common Colors
/*===============================================================================*/

struct ViewConstants
{
    static let UINAV_BAR_COLOR                             = UIColor(red: 23.0/255, green: 181.0/255, blue: 212.0/255.0, alpha: 1).cgColor
    static let UIVIEW_BORDER_COLOR                         = UIColor(red: 225.0/255, green: 226.0/255, blue: 227.0/255.0, alpha: 1).cgColor
    static let UIVIEW_BORDER_WIDTH : CGFloat               = 1.0
    static let UIVIEW_CORNER_RADIUS : CGFloat              = 5.0
    static let FLOAT_CONSTANT_60                           = 60.0
    static let NAVBAR_HEIGHT : CGFloat                     = 44.0

}


/*===============================================================================*/
// MARK: Screen Size structs
/*===============================================================================*/
struct ScreenSize
{
    static let SCREEN_WIDTH = UIScreen.main.bounds.size.width
    static let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
    static let SCREEN_MAX_LENGTH = max(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
    static let SCREEN_MIN_LENGTH = min(ScreenSize.SCREEN_WIDTH, ScreenSize.SCREEN_HEIGHT)
}

/*===============================================================================*/
// MARK: Device Types
/*===============================================================================*/

struct DeviceType
{
    static let IS_IPHONE_4_OR_LESS =  UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH < 568.0
    static let IS_IPHONE_5 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 568.0
    static let IS_IPHONE_6 = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 667.0
    static let IS_IPHONE_6P = UIDevice.current.userInterfaceIdiom == .phone && ScreenSize.SCREEN_MAX_LENGTH == 736.0
    static let IS_IPHONE =  UIDevice.current.userInterfaceIdiom == .phone
    static let IS_IPAD =  UIDevice.current.userInterfaceIdiom == .pad
}

}

