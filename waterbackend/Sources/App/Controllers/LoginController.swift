//
//  File.swift
//  
//
//  Created by David Fanaro on 8/14/20.
//

import Vapor
import Fluent

class LoginController: RouteCollection{
    func boot(routes: RoutesBuilder) throws {
        let path = routes.grouped(User.authenticator())
        path.post("login", use: login)
        let tokenpath = routes.grouped(Token.authenticator())
        tokenpath.post("tokenlogin", use: tokenlogin)
        
    }
    
    
    func login(req: Request) throws -> EventLoopFuture<Token>{
        let user = try req.auth.require(User.self)
        let token = try user.createToken()
        return token.save(on: req.db).map{
            token
        }
    }
    func tokenlogin(req: Request) throws -> User{
        try req.auth.require(User.self)
    }
    
}
