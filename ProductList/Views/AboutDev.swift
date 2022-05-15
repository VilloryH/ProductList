//
//  AboutDev.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 15.05.22.
//

import Foundation
import SwiftUI

struct AboutDev: View {
    var body: some View {
        ZStack {
            VStack{
                Image("profileim")
                    .resizable(resizingMode: .stretch)
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 150, height: 150)
                    .cornerRadius(10)

                VStack{
                Text("Петровский В.С.")
                        .font(.system(size: 25).weight(.bold))
                Text("Группа 981072")
                Text("Лабораторная № 2")
                }.padding()
                .font(.system(size: 18).bold())
            }
            .padding()
            .frame(width: 300, height: 300)
            .background(ZStack{
                Circle().fill(.white)
                
                .shadow(color: Color("zback"), radius: 8, x: -10, y: -8)
                .shadow(color: .black, radius: 8, x: 10, y: 8)
            }
                    )
            
        }
    }
}

