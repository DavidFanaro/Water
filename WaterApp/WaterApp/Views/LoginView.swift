//
//  LoginView.swift
//  WaterApp
//
//  Created by David Fanaro on 8/14/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var settings: UserSettings
    
    @State var username = ""
    @State var password = ""
    
    @Binding var isPersented: Bool
    var body: some View {
        
        
        
        ZStack {
            Image("AppBackground")
                .resizable() .edgesIgnoringSafeArea(.all).blur(radius: 10)
            
            
            
            
            VStack {
                
                
                Text("Water")
                    .font(.system(size: 60))
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .padding(30.0)
                    .shadow(radius: 10)
                
                
                
                
                Text("Login")
                    .foregroundColor(Color.white)
                    .font(.system(size: 30))
                    
                    .fontWeight(.bold)
                    .shadow(radius: 10)
                
                
                TextField("Username", text: $username)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                    .shadow(radius: 10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(20)
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 15, trailing: 20))
                    .shadow(radius: 10)
                    .disableAutocorrection(true)
                    .autocapitalization(.none)
                
                Button(action: {
                    self.settings.loginUser(login: self.username, with: self.password)
                    self.isPersented = false
                }){
                    
                    VStack {
                        //[…]
                        Text("LOGIN")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.gray)
                            .cornerRadius(15.0)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                }
                Button(action: {
                    self.isPersented = false
                }){
                    
                    VStack {
                        //[…]
                        Text("Close")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220/2, height: 60/2)
                            .background(Color.gray)
                            .cornerRadius(15.0/2)
                            .shadow(radius: 10)
                    }
                    .padding()
                    
                }
            }.onDisappear{
//                self.settings.getUser(user: self.settings.userToken)
                print(self.settings.getAllPost(userToken: self.settings.userToken))
                self.settings.getAllPost(userToken: self.settings.userToken)
                
            }
            
            
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
