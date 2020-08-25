//
//  FloatingButton.swift
//  WaterApp
//
//  Created by David Fanaro on 8/23/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    
    var action: () -> Void
    
    var body: some View {
        Button(action: action){
            Image(systemName: "plus")
                .foregroundColor(.white)
                .font(.system(size: 50))
            .padding(15)
                .background(Color(.gray))
                .mask(Circle())
            
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(){
            
        }
    }
}
