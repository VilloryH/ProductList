//
//  Posts.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 6.04.22.
//

import SwiftUI


struct Posts: View {
    @State var abc = 0
    @StateObject var viewModel = ViewModel()
    var body: some View {
    
            List{
                ForEach(viewModel.post, id: \.self){
                    posts in
                  
                    VStack(alignment: .leading,spacing: 5){
                        HStack{Spacer()
                        
                        URLImage(urlString: posts.url)
                            .cornerRadius(10)
                            Spacer()
                        }
                            VStack(alignment: .leading, spacing: 5){
                                Text(posts.title)
                                    .font(.title)
                                    .lineLimit(1)
                                Text(posts.subtitle)
                                    .font(.title2)
                            Spacer()
                                HStack{
                            Text("\(posts.price) BYN")
                                    .font(.system(size: 20).bold())
                                    Text("~ \(viewModel.post.count)").onAppear{
                                        abc = viewModel.post.count
                                       
                                    }
                            Text("\(posts.price) $")
                                }
                            }.padding()
                    }
                   
                    
                    
                }.padding(.vertical, 10)
            }
                .onAppear{
                    
                    viewModel.fetch()
                  
                   
                }
        
    }
    
}

struct Posts_Previews: PreviewProvider {
    static var previews: some View {
        Posts()
    }
}
