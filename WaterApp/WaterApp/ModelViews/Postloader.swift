//
//  Postloader.swift
//  WaterApp
//
//  Created by David Fanaro on 8/22/20.
//  Copyright © 2020 David Fanaro. All rights reserved.
//

import Foundation

class Postloader: ObservableObject {
    
    @Published var posts:[Drop] = []
    
    
    func getAllPost(userToken: String){
        
        let loginString = userToken
        guard let url = URL(string: "http://127.0.0.1:8080/drops/all") else{return}
        var request = URLRequest(url: url)
        request.setValue("Bearer \(loginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                   
                   
            guard let data = data else{return}
                   
            guard let json = try? JSONDecoder().decode([Drop].self, from: data) else{return}
                   
            DispatchQueue.main.async {
                
                print(json)
                self.posts = json
                
                
            }
                   
        }.resume()
        
    }
    
    func getAllPost(userToken: String, completion: () -> Void){
        
        let loginString = userToken
        guard let url = URL(string: "http://127.0.0.1:8080/drops/all") else{return}
        var request = URLRequest(url: url)
        request.setValue("Bearer \(loginString)", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
                   
                   
            guard let data = data else{return}
                   
            guard let json = try? JSONDecoder().decode([Drop].self, from: data) else{return}
                   
            DispatchQueue.main.async {
                
                print(json)
                self.posts = json
                
                
            }
                   
        }.resume()
        
        completion()
        
    }
    
    
    
    
}
