import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ListingViewModel()
    var body: some View {
        VStack {
            List{
                let items = viewModel.listingModel.items
                
                ForEach(items, id: \.id) { item in
                    VStack{
                        Text(viewModel.getCategoryNameById(for: item.category_id)).frame(maxWidth: .infinity, alignment: .leading)
                        ZStack(alignment: .topTrailing) {
                            ImageView.init(url: item.images_url?.thumb)
                            if item.is_urgent {
                                Text("URGENT")
                                    .font(.headline)
                                    .bold()
                                    .foregroundStyle(.white)
                                    .padding()
                                    .background(.red)
                                    .clipShape(Capsule())
                                    .padding(.top, 5)
                                    .padding(.trailing, 5)
                            }
                        }
                        
                        Text(item.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                      
                        
                        Text("\(item.price, specifier: "%.2f") €")
                            .font(.subheadline)
                        
                    }
                }
                
            }
        }
        .padding()
        .task {
            await viewModel.loadList()
            await viewModel.getCategory()
        }
    }
}

#Preview {
    ContentView()
}
