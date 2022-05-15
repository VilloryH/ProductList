//
//  FirstList.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import SwiftUI

struct FirstList: View {
  
    var body: some View {
        ZStack{
          
            VStack{
                ScrollView{
                   
                        ForEach(posterdata){ item in
                            FeaturedItem(poster: item)
                                .padding(.vertical,40)
                                .frame(maxWidth: .infinity)
                            
                        
                    }
                }
            }
        }
    }
}

struct FirstList_Previews: PreviewProvider {
    static var previews: some View {
        FirstList()
    }
}
