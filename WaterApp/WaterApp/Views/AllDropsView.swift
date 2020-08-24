//
//  AllDropsView.swift
//  WaterApp
//
//  Created by David Fanaro on 8/21/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct AllDropsView: View {
    
    @EnvironmentObject var settings: UserSettings
    @State var showCreate:Bool = false

    
    var drops: [Drop]
    
    init(drops:[Drop]) {
        self.drops = drops
        
        
        UITableViewCell.appearance().backgroundColor = .clear
        UITableView.appearance().backgroundColor = .clear
        UINavigationBar.appearance().backgroundColor = .clear
        
        
        // this is not the same as manipulating the proxy directly
        let appearance = UINavigationBarAppearance()
        
        // this overrides everything you have set up earlier.
        appearance.configureWithTransparentBackground()
        
        // this only applies to big titles
        appearance.largeTitleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ]
        // this only applies to small titles
        appearance.titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor.white,
        ]
        
        
        //In the following two lines you make sure that you apply the style for good
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
        UINavigationBar.appearance().standardAppearance = appearance
        
        // This property is not present on the UINavigationBarAppearance
        // object for some reason and you have to leave it til the end
        UINavigationBar.appearance().tintColor = .white

    }

    var body: some View {
        
        ZStack{
            Image("AppBackground")
            .resizable() .edgesIgnoringSafeArea(.all).blur(radius: 10)
            
            
            
            NavigationView{
                List(drops, id: \.id){ drop in
                    DropCell(drop: drop )
                }
                
                .navigationBarTitle(Text("Water"),displayMode: .automatic).foregroundColor(.white)
                .navigationBarItems( trailing: Button(action: {
                    self.settings.getAllPost(userToken: self.settings.userToken)
                    
                }, label: {
                    Text("Refresh")
                }))
                .background(Image("AppBackground").resizable() .edgesIgnoringSafeArea(.all).blur(radius: 10))
            }.sheet(isPresented: self.$showCreate){
                CreateDropDetailView(isPersented: self.$showCreate)
            }
        
            VStack{
                Spacer()
                HStack {
                    Spacer()
                    FloatingButton(){
                        self.showCreate.toggle()
                    }.padding()
                }
            }
            
        }
        
    }
}

struct AllDropsView_Previews: PreviewProvider {
    static var previews: some View {
        AllDropsView(drops: [Drop(id: "1", title: "Test", drop_content: "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh", user: UserId(id: "David"))])
    }
}
