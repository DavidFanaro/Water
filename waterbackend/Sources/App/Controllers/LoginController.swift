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
    }
    
    
    func login(req: Request) throws -> User {
        try req.auth.require(User.self)
    }
    
}
