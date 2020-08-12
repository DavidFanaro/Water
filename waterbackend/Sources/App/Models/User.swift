//
//  File.swift
//  
//
//  Created by David Fanaro on 8/12/20.
//

import Vapor
import Fluent
import FluentPostgresDriver

final class User: Model {
    static var schema: String = "users"
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "firstname")
    var firstname:String
    
    @Field(key: "lastname")
    var lastname:String
    
    @Field(key: "username")
    var username:String
    
    @Field(key: "password")
    var password:String
    
    @Children(for: \.$user)
    var drops:[Drop]
    

    
    init() {}
    
    init(id:UUID?, first:String, last:String, user:String, pass:String) {
        self.id = id
        self.firstname = first
        self.lastname = last
        self.username = user
        self.password = pass
    }
    
}

extension User : Codable {}
extension User : Content{}

