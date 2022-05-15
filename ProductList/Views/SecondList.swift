//
//  SecondList.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import SwiftUI

struct SecondList: View {
    var body: some View {
        ZStack{
          
            VStack{
                ScrollView{
                   
                        ForEach(posterdata1){ item in
                            FeaturedItem(poster: item)
                                .padding(.vertical,40)
                                .frame(maxWidth: .infinity)
                            
                        
                    }
                }
            }
        }
    }
}

struct SecondList_Previews: PreviewProvider {
    static var previews: some View {
        SecondList()
    }
}
