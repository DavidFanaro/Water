//
//  File.swift
//  
//
//  Created by David Fanaro on 8/14/20.
//

import Vapor
import Fluent

class DropController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let path =  routes.grouped(Token.authenticator())
        path.get("drops", "all", use: getAllDrops)
    }
    
    func getAllDrops(req: Request) throws -> EventLoopFuture<[Drop]> {
        return Drop.query(on: req.db).all()
    }
}
