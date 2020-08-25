//
//  DropCell.swift
//  WaterApp
//
//  Created by David Fanaro on 8/21/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct DropCell: View {
    
    var drop: Drop
    //var token: String
    
    //private var user: UserData
    
    
    var body: some View {
        
        ZStack{
            
            VStack{
                HStack {
                    Text("User: \(drop.username)").padding(.trailing)
                    Text(drop.title).padding(.leading, 40)
                    Spacer()
                }.padding()
                
                VStack {
                    
                    Text(drop.content).lineLimit(20)
                }
                
            }
        }.onAppear{
                
        }
        
    }
}

//struct DropCell_Previews: PreviewProvider {
//    static var previews: some View {
//        DropCell(drop: Drop(id: "1", title: "Test", drop_content: "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh", user: UserId(id: "3")))
//            .previewLayout(.fixed(width: 300, height: 250))
//
//    }
//}
