//
//  ViewModel.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 6.04.22.
//

import Foundation
import SwiftUI

struct Post: Hashable, Codable, Identifiable {
    var id:Int
    var title: String
    var subtitle: String
    var price:Int
    var url: String
}


class ViewModel: ObservableObject {
    @Published var post:[Post] = []
    @Published var posttwo:[Post] = []
    @Published var ownpost:[Post] = []
    func fetch(){
        guard let url = URL(string: "https://my-json-server.typicode.com/villoryh/jsondemo/posts") else {
            return
        }
        guard let url1 = URL(string: "https://my-json-server.typicode.com/villoryh/jsondemo/posttwo") else {
          return
        }
       
        let task = URLSession.shared.dataTask(with: url){ data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let post = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.post = post
                   
                }
            }
            catch{
                print(error)
            }
        }
        let tasktwo = URLSession.shared.dataTask(with: url1){ data,
            _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posttwo = try JSONDecoder().decode([Post].self, from: data)
                DispatchQueue.main.async {
                    self.posttwo = posttwo
                }
            }
            catch{
                print(error)
            }
        }
        task.resume()
        tasktwo.resume()
     
       
    }

   
   
}
