//
//  PostList.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 5.04.22.
//

import SwiftUI

struct PostList: View {
    @State var posts:[Post] = []
    var body: some View {
        List(posts){ post in
            Text("hello")
            
        }.onAppear{
            Api().getPosts{ (posts) in
                self.posts = posts
                
            }
        }
    }
}

struct PostList_Previews: PreviewProvider {
    static var previews: some View {
        PostList()
    }
}
