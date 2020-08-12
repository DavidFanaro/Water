
//
//  File.swift
//  
//
//  Created by David Fanaro on 8/12/20.
//

import Vapor
import Fluent

final class Drop: Model{
    static var schema: String = "drops"
    
    
    @ID(key: .id)
    var id: UUID?
    
    @Field(key: "title")
    var title: String
    
    @Field(key: "drop_content")
    var drop_content: String
    
    @Parent(key: "user_id")
    var user: User
    
    init() {}
    
    init(id:UUID?, title:String, content:String) {
        self.id = id
        self.title = title
        self.drop_content = content
    }
    
}

extension Drop: Codable, Content{}
