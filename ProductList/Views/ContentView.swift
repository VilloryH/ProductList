

import SwiftUI

struct ContentView: View {
    @AppStorage("selectedTab") var selectedTab: Tab = .home
    @EnvironmentObject var model:Model
    var body: some View {
       
        ZStack(){
          
            switch selectedTab {
            case .home:
                HomeView()
            case .searching:
               SearchView()
            case .profile:
               ProfileView()
            }
           
          TabBar()
               
        }.safeAreaInset(edge: .bottom){
            Color.clear.frame(height: 44)}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView() .environmentObject(Model())
    }
}
