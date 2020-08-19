//
//  ContentView.swift
//  WaterApp
//
//  Created by David Fanaro on 8/12/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var settings: UserSettings
    
    var body: some View{
        LoginChecker().environmentObject(settings)
        
    }
    
}

struct LoginChecker: View {
    
    @EnvironmentObject var settings: UserSettings
    
    @ViewBuilder
    var body: some View {
        
        VStack{
            if settings.isLoggedin{
                Text("Logged in as \(self.settings.userToken)")
                Text("Logged in as \(self.settings.userdata?.firstname ?? "Error")")
                
            }else{
                LoginOrSignUpView().environmentObject(settings)
            }
        }
        
    }
}

struct LoginOrSignUpView: View {
    @EnvironmentObject var settings: UserSettings

    @State var showSignup:Bool = false
    @State var showLogin:Bool = false
    var body: some View{
        ZStack{
            Image("AppBackground")
            .resizable() .edgesIgnoringSafeArea(.all).blur(radius: 10)
            
            VStack{
                Button(action: {
                    self.showSignup.toggle()
                }) {
                    VStack {
                        //[…]
                        Text("SIGNUP")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(width: 220, height: 60)
                            .background(Color.gray)
                            .cornerRadius(15.0)
                            .shadow(radius: 10)
                    }
                    .padding()
                }.sheet(isPresented: self.$showSignup) {
                    SignupView(isPersented: self.$showSignup).environmentObject(self.settings)
                }
                
                Button(action: {
                    self.showLogin.toggle()
                }) {
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
                }.sheet(isPresented: self.$showLogin) {
                    LoginView(isPersented: self.$showLogin).environmentObject(self.settings)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
