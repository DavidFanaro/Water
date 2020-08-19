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
        path.webSocket("drops","all","socket", onUpgrade: getAllDropsSocket)
    }
    
    func getAllDrops(req: Request) throws -> EventLoopFuture<[Drop]> {
        return Drop.query(on: req.db).all()
    }
    
    
    func getAllDropsSocket(req: Request, sock:WebSocket) {
        var allDrops = Drop.query(on: req.db).all().map{ drops -> String in
            guard let data = try? JSONEncoder().encode(drops)else{
                throw Abort(.internalServerError)
            }
            guard let jsonString = String(data:data,encoding: .utf8) else{
                throw Abort(.internalServerError)
            }
            return jsonString
        }

    }
    
}
