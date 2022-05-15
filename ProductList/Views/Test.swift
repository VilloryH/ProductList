
import SwiftUI


struct FeatureItem: View {
    @ObservedObject var viewModel = ViewModel()
    @State var post:[Post] = []
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8.0){
           Spacer()
            
           Image ("PartyLogo")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode : .fit)
                .frame(width: 26.0, height: 26.0)
                .cornerRadius(10)
                .padding(9)
                .background(.ultraThinMaterial, in:
                                RoundedRectangle(cornerRadius: 30,
                                                         style: .continuous))
            Text(post.title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            
            Text(post.subtitle.uppercased())
                .font(.footnote)
                .fontWeight(.semibold)
                .foregroundStyle(.linearGradient(colors: [.white, Color("Party").opacity(0.5)], startPoint: .topLeading, endPoint: .bottomTrailing))
            Text("descrip")
                .font(.footnote)
                .multilineTextAlignment(.leading)
                .lineLimit(2)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(.secondary)
           
          
        
        }
        .padding(.all, 20.0)
        .padding(.vertical, 20)
        .frame(height: 350.0)
        
        .background(.ultraThinMaterial, in:
                        RoundedRectangle(cornerRadius: 30,
                                                 style: .continuous))
      
       
        
    .padding(.horizontal, 20)
    }
}

struct FeatureItem_Previews: PreviewProvider {
    static var previews: some View {
        FeatureItem()
            .preferredColorScheme(.dark)
    }
}
