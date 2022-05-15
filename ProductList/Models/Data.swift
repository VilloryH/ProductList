//
//  Data.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 5.04.22.
//

import SwiftUI

struct Post: Codable, Identifiable {
    var id = UUID()
    var title:String
    var price:String
    
}

class Api{
    func getPosts(completion: @escaping ([Post]) -> ()){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {fatalError("incorrect URL")}
        
        URLSession.shared.dataTask(with: url){
            (data, _, _) in
            let posts = try! JSONDecoder().decode([Post].self, from: data!)
            
            DispatchQueue.main.async {
                completion(posts)
            }
        }.resume()
    }
}
