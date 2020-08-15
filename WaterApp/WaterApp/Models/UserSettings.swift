//
//  UserSettings.swift
//  WaterApp
//
//  Created by David Fanaro on 8/15/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var userToken = ""
    @Published var userdata: UserData?
    
    func loginUser(login username: String, with password: String){
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        guard let url = URL(string: "localhost:8080/login") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            
            guard let data = data else{return}
            
            guard let json = try? JSONDecoder().decode(UserToken.self, from: data) else{return}
            
            DispatchQueue.main.async {
                self.userToken = json.value
            }
            
            
        }.resume()
    }
    
    func getUser(user token:String) {
        
        let loginString = String(format: "%@", token)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        guard let url = URL(string: "localhost:8080/tokenlogin") else{return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(base64LoginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                   
                   
            guard let data = data else{return}
                   
            guard let json = try? JSONDecoder().decode(UserData.self, from: data) else{return}
                   
            DispatchQueue.main.async {
                self.userdata = json
            }
                   
                   
        }.resume()
        
    }
    
    
}
