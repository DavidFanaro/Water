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
        //path.webSocket("drops","all","socket", onUpgrade: getAllDropsSocket)
    }
    
    func getAllDrops(req: Request) throws -> EventLoopFuture<[Drop]> {
        
        return Drop.query(on: req.db).all()
    }
    
    
//    func getAllDropsSocket(req: Request, sock:WebSocket) {
//
//        do{
//
//            var sockData: [Drop]!
//
//            var _ = Drop.query(on: req.db).all().map{ drops in
//                sockData = drops
//            }
//            if sockData != nil{
//                let jsonData = try JSONEncoder().encode(sockData)
//
//                sock.send(jsonData.base64EncodedString())
//                sock.close()
//            }
//
//        }catch{
//            sock.send("Error")
//            sock.close()
//        }
//
//    }
    
}
