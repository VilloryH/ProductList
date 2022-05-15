

import SwiftUI


struct URLImage: View {
    
    let urlString:String
    @State var data:Data?
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .frame(width: 200, height: 200)
        }
        else{
            Image("no")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 130, height: 130)
                .onAppear{
                    fetchData()
                }
        }
    }
        private func fetchData(){
            guard let url = URL(string: urlString) else {
                return
            }
            let task = URLSession.shared.dataTask(with: url){ data, _, _ in
                self.data = data
            }
            task.resume()
        }
    }


struct HomeView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var post:[Post] = []
    @State private var selected = 0
    var body: some View {
      
        ZStack{
            if Reachability.isConnectedToNetwork(){
            VStack{
                Text("Product List")
                    .font(.system(size: 30))
       
           
                upbuttons
              
                TabView(selection: $selected){
                  
                    post1
                        .tag(0)
                    post2
                        .tag(1)
                   
                   
                }.tabViewStyle(.page(indexDisplayMode: .never))
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
  
   
    var post1: some View {
        ZStack{
            List(viewModel.post){
              
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
                   
                    
                    
               
        }.padding(.vertical, 10)
                .onAppear{
                    
                    viewModel.fetch()
                }

        }
    }
    
    var post2:some View{
        List(viewModel.posttwo){
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
                                
                        Text("~")
                        Text("\(posts.price) $")
                            }
                        }.padding()
                }
               
                
                
           
        }.padding(.vertical, 10)
            .onAppear{
                viewModel.fetch()
            }
    
    }
    
    var upbuttons:some View {
        
         HStack{
        Button(action: {
            withAnimation(.easeInOut(duration: 1)){
            selected = 0
              
            }
        }, label: {
            Text("Phones (\(viewModel.post.count))")
                .font(.system(size: 20).weight(.bold))
                .frame(width: 170, height: 40)
                .background(selected == 0 ? .blue : .white)
                .foregroundColor(selected == 0 ? .white : .gray)
                .cornerRadius(10)
        })
            
            Button(action: { withAnimation(.easeInOut(duration: 1)){
                selected = 1
                }}, label: {
                Text("Laptops (\(viewModel.posttwo.count))")
                .font(.system(size: 20).weight(.bold))
                .frame(width: 170, height: 40)
                .background(selected == 1 ? .blue : .white)
                .foregroundColor(selected == 1 ? .white : .gray)
                .cornerRadius(10)
        })
        }.border(Color.gray, width: 3)
            .cornerRadius(5)
        .background(RoundedRectangle(cornerRadius: 30,
                    style: .continuous).fill(.white)
            )
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
