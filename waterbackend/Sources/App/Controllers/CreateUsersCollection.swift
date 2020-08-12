//
//  File.swift
//  
//
//  Created by David Fanaro on 8/12/20.
//

import Vapor
import Fluent

class CreateUsersController: RouteCollection{
    
    func boot(routes: RoutesBuilder) throws {
        let current = routes.grouped("createuser")
        current.get(use: GetAllUser)
        current.post(use: CreateUser)
    }
    
    func GetAllUser(req: Request) throws -> EventLoopFuture<[String]> {
        let user = User.query(on: req.db).all(\.$username)
        return user
    }
    
    func CreateUser(req: Request) throws -> EventLoopFuture<User> {
        let user = try req.content.decode(User.self)
        return user.save(on: req.db).map{
            user
        }
    }
    
}
