import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ListingViewModel()
    var body: some View {
        VStack {
            List{
                let items = viewModel.listingModel.items
                
                ForEach(items, id: \.id) { item in
                    VStack{
                        ImageView.init(url: item.images_url?.thumb)
                        Text(item.title)
                            .font(.headline)
                            .multilineTextAlignment(.center)
                        if item.is_urgent {
                            Text("URGENT").font(.caption2).bold().foregroundStyle(.red)
                        }
                            
                        Text("\(item.price, specifier: "%.2f") €")
                            .font(.subheadline)
                    }
                }
            }
        }
        .padding()
        .task {
            await viewModel.loadList()
        }
    }
}

#Preview {
    ContentView()
}
