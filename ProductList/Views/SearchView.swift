//
//  SearchView.swift
//  ProductList
//
//  Created by Vitaliy Petrovskiy on 4.04.22.
//

import SwiftUI

struct SearchView: View {
    @State private var selectedStrength = "Бренд"
    let strengths = ["Бренд","Модель", "Цена"]
    @State private var searchinput = ""
    @State private var firstprist: Double = 0
    @State private var lastprice: Double = 0
   
    @ObservedObject var viewModel = ViewModel()
    var body: some View {
        ZStack {
            if Reachability.isConnectedToNetwork(){
            VStack(spacing:10){
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Поиск", text: $searchinput)
                        .background(.ultraThickMaterial)
                        .font(.system(size: 25))
                    .cornerRadius(10)
                }
                
                Picker("Strength", selection: $selectedStrength) {
                                       ForEach(strengths, id: \.self) {
                                           Text($0)
                                       }
                }.pickerStyle(.segmented)
                
                if selectedStrength == "Цена" {
                    HStack{
                        VStack{
                            Text("От \(firstprist, specifier: "%.0f")")
                            Slider(value: $firstprist, in: 0...10000)
                        }
                        VStack{
                            Text("До \(lastprice < firstprist ? firstprist : lastprice, specifier: "%.0f")")
                            Slider(value: $lastprice, in: firstprist...10000)
                        }
                    }
                }
                if searchinput != "" {truesearch} else {Text("Введите критерии для поиска")}
                
                Spacer()
            }.padding()
                .onAppear{
                    
                    viewModel.fetch()
                }
        }
            else {
                VStack{
                    Spacer()
                Text("Проверьте интернет соединение")
                    .font(.system(size: 20).bold())
                    .padding()

                Button(action: {viewModel.fetch()}, label: {
                    Image(systemName: "gobackward")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .foregroundColor(.gray)
                        .background(.ultraThinMaterial)
                        .cornerRadius(10)
                }).frame(width: 50, height: 50)
                    Spacer()
                }.padding()
            }
            
        }
        
    }
    
    var truesearch:some View {
        ScrollView {
            ForEach(viewModel.post){
                    posts in
                let k = posts.price
                let b = posts.title.lowercased()
                let m = posts.subtitle.lowercased()
                if (selectedStrength == "Бренд" && b.contains(searchinput.lowercased())) ||
                    (selectedStrength == "Модель" && m.contains(searchinput.lowercased())) ||
                (selectedStrength == "Цена" && k >= Int(firstprist) || k <= Int(lastprice)){
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
                                    Text(" ~ ")
                            Text("\(posts.price) $")
                                }
                            }.padding()
                    }
                   
                    
                }
              
            
                
               
            }
           
                //Text("Результат поиска не обнаружен 😞")
            
            ForEach(viewModel.posttwo){
              
                posts in
                let k = posts.price
                let b = posts.title.lowercased()
                let m = posts.subtitle.lowercased()
                if (selectedStrength == "Бренд" && b.contains(searchinput.lowercased())) ||
                    (selectedStrength == "Модель" && m.contains(searchinput.lowercased())) ||
                (selectedStrength == "Цена" && k >= Int(firstprist) || k <= Int(lastprice)){
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
                                        Text(" ~ ")
                                Text("\(posts.price) $")
                                    }
                                }.padding()
                    }
                }
                   
                    
                    
               
        }
            }.padding(.vertical, 10)
        .onAppear{
                viewModel.fetch()
        }
    }
    
    var nosearch: some View{
        ScrollView {
            ForEach(viewModel.post){
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
                                    Text(" ~ ")
                            Text("\(posts.price) $")
                                }
                            }.padding()
                    }
                   
                    
                
               
        }
            ForEach(viewModel.posttwo){
              
                posts in
                let k = posts.price
                let b = posts.title.lowercased()
                let m = posts.subtitle.lowercased()
                if (selectedStrength == "Бренд" && b.contains(searchinput.lowercased())) ||
                    (selectedStrength == "Модель" && m.contains(searchinput.lowercased())) ||
                (selectedStrength == "Цена" && k >= Int(firstprist) || k <= Int(lastprice)){
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
                                        Text(" ~ ")
                                Text("\(posts.price) $")
                                    }
                                }.padding()
                    }
                }
                   
                    
                    
               
        }
            }.padding(.vertical, 10)
        .onAppear{
                viewModel.fetch()
        }
    }

    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
