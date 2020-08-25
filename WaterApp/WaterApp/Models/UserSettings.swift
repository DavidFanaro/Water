//
//  UserSettings.swift
//  WaterApp
//
//  Created by David Fanaro on 8/15/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import Foundation

class UserSettings: ObservableObject {
    @Published var userToken = ""{
        didSet{
            getUser(user: userToken)
        }
    }
    @Published var userdata: UserData?
    @Published var isLoggedin: Bool = false
    @Published var post:[Drop] = []
    
    func loginUser(login username: String, with password: String){
        let loginString = String(format: "%@:%@", username, password)
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        guard let url = URL(string: "http://127.0.0.1:8080/login") else{
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
                self.isLoggedin = true
            }
            
            
        }.resume()
        
    }
    
    func getUser(user token:String) {
        
        let loginString = userToken
        guard let url = URL(string: "http://127.0.0.1:8080/tokenlogin") else{return}
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("Bearer \(loginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                   
                   
            guard let data = data else{return}
                   
            guard let json = try? JSONDecoder().decode(UserData.self, from: data) else{return}
                   
            DispatchQueue.main.async {
                self.userdata = json
                print(json)
            }
                   
                   
        }.resume()
        
    }
    
    func signupuser(firstname: String, lastname: String, username:String, password:String) {
        let newUser = UserData(firstname: firstname, lastname: lastname, username: username, password: password)
        guard let postData = try? JSONEncoder().encode(newUser) else {
            return
        }
        
        guard let url = URL(string: "http://127.0.0.1:8080/signup") else{
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = postData
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            
            guard let data = data else{return}
            
            guard let json = try? JSONDecoder().decode(UserData.self, from: data) else{return}
            
            DispatchQueue.main.async {
                
                print(json)
                
            }
            
            
        }.resume()
        
    }
    
    func getAllPost(userToken: String){
        
        let loginString = userToken
        guard let url = URL(string: "http://127.0.0.1:8080/drops/all") else{return }
        var request = URLRequest(url: url)
        request.setValue("Bearer \(loginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                   
                   
            guard let data = data else{return}
                   
            guard let json = try? JSONDecoder().decode([Drop].self, from: data) else{return}
                   
            DispatchQueue.main.async {
                
                print(json)
                self.post = json
                
                
            }
                   
        }.resume()
        
    }
    
    func createPost(userToken: String, title:String, content:String){
        print("Starting post")
        guard let url = URL(string: "http://127.0.0.1:8080/createdrop") else{
            return
        }
        let loginString = userToken
        var request = URLRequest(url: url)
        let postContent = PostRequset(title: title, content: content)
        guard let postData = try? JSONEncoder().encode(postContent) else{
            return
        }
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("Bearer \(loginString)", forHTTPHeaderField: "Authorization")
        request.httpBody = postData
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            
            
            guard let data = data else{return}
            
            guard let json = try? JSONDecoder().decode(UserData.self, from: data) else{return}
            
            DispatchQueue.main.async {
                
                print(json)
                
            }
            
            
        }.resume()
        
    }
    
    
    func testPrint(){
        print("it works")
    }
    
}
