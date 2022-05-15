//
//  Tabs.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import Foundation
import SwiftUI

struct TabItem: Identifiable{
    var id = UUID()
    var text:String
    var icon:String
    var tab:Tab
    var color: Color
}

var tabItems = [
    TabItem(text:"Home",icon: "house.fill",tab: .home, color: .blue),
    TabItem(text: "Search", icon: "magnifyingglass", tab: .searching, color: .blue),
    TabItem(text: "Profile", icon: "person.fill",tab:.profile, color: .blue),
   
    
]

enum Tab:String{
    case home
    case searching
    case profile
   
}

struct TabPreferenceKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
