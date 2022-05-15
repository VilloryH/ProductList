//
//  FeaturedItem.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import SwiftUI

struct FeaturedItem: View {
    @StateObject var viewModel = ViewModel()
    var poster:poster = posterdata[0]
    var body: some View {
        ZStack{
            HStack{
                Image("no")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 70, height: 70)
                    .cornerRadius(10)
                VStack(alignment: .leading, spacing: 5){
                    Text(poster.title)
                        .font(.headline)
                    Text(poster.subtitle)
                        .font(.subheadline)
                       
                }
                
                Spacer()
                Text(poster.price)
            }.padding()
                .frame(width: 350, height: 130)
                .background(ZStack{
                    Color("Back")
                    RoundedRectangle(cornerRadius: 16, style: .continuous)
                        .foregroundColor(.white)
                        .blur(radius: 4)
                        .shadow(color: .white, radius: 8, x: -8, y: -8)
                        .shadow(color: .black, radius: 8, x: 8, y: 8)
                       
                })
                
        }
    }
}

struct FeaturedItem_Previews: PreviewProvider {
    static var previews: some View {
        FeaturedItem()
    }
}
