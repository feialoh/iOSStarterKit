//
//  UserModel.swift
//  iOSStarterKit
//
//  Created by Feialoh Francis on 8/14/18.
//  Copyright © 2018 Feialoh Francis. All rights reserved.
//

import Foundation

struct User {
    var userId: String
    var name: String
    var country: String
    var email: String
    var userType: String
    var alreadyLoggedIn: String
}

struct LoginStatusModel {
    var loggedInOtherDevice: Bool
}

