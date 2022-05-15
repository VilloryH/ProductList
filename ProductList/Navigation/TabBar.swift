//
//  TabBar.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import SwiftUI

struct TabBar: View {
    
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @State var tabItemWidth:CGFloat = 0
    var body: some View {
        HStack{
            buttons
        }
        .padding(.horizontal, 8)
        .padding(.top,14)
        .frame(height:88, alignment: .top)
        .background(.ultraThickMaterial, in:
                        RoundedRectangle(cornerRadius: 34,style: .continuous))
       
      
        .frame(maxHeight: .infinity, alignment: .bottom)
        .ignoresSafeArea()
    }
    var buttons: some View {
        ForEach(tabItems) { item in
            Button{
                withAnimation(.spring(response: 0.5, dampingFraction: 0.7)){
                    selectedTab = item.tab
                    //color = item.color
                }
            } label: {
                VStack(spacing: 0){
                Image(systemName: item.icon)
                    .symbolVariant(.fill)
                    .font(.body.bold())
                    .frame(width: 44, height: 29)
                Text(item.text)
                    .font(.body)
                    .lineLimit(1)
            }
                .frame(maxWidth: .infinity)
            }.foregroundStyle(selectedTab == item.tab ? Color(.blue) : Color(.black))
               
                .overlay(
                    GeometryReader{
                        proxy in
                        Color.clear.preference(key: TabPreferenceKey.self, value: proxy.size.width)
                    }
                )
                .onPreferenceChange(TabPreferenceKey.self){
                    value in
                    tabItemWidth = value
                }
        
        }
    }
  
    
  
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
