//
//  File.swift
//  
//
//  Created by David Fanaro on 8/14/20.
//

import Vapor
import Fluent

class DropCreationController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let request = routes.grouped("createdrop")
        //request.post(use: createdrop)
    }
    
//    func createdrop(req: Request) -> EventLoopFuture<Drop> {
//
//    }
}
