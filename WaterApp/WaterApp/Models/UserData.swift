//
//  UserData.swift
//  WaterApp
//
//  Created by David Fanaro on 8/15/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import Foundation

struct UserData: Codable {
    var firstname: String
    var lastname: String
    var username: String
    var password: String
}

struct UserId: Codable {
    var id: String
}

struct UserToken: Codable {
    var id: String
    var user: UserId
    var value: String
    
}


struct Drop: Codable, Identifiable {
    var userid: String
    var id: String
    var username: String
    var title: String
    var content: String
}


struct PostRequset : Codable{
    var title: String
    var content: String
}
