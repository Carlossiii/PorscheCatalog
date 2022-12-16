//
//  ContentView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 07/12/22.
//

import SwiftUI

struct ContentView: View {
    
    enum LoadingState {
        case loading, loaded, failed
    }

    @State private var loadingState = LoadingState.loading
    @State private var pages = [Pages]()
    
    @State private var cars: [Car] = [.porsche356, .category911, .porscheGT1, .porsche912, .porsche914, .porsche918, .porsche924, .porsche928, .porsche944, .porsche959, .porsche968, .categoryBoxter, .porscheCarreraGT, .categoryCayman, .porscheCayenne, .porscheMacan, .porschePanamera, .porscheTaycan]
    @State private var selectedCar = 0
    
    var body: some View {
        NavigationStack {
            Form {
                List(cars, children: \.items) { item in
                    Button(item.name) {
                        selectedCar = item.pageId
                        Task {
                            await fetchCarData()
                        }
                    }
                    NavigationLink(value: item) { }
                }
            }
            .navigationTitle("Porsche Catalog")
            .navigationDestination(for: Car.self) { item in
                switch loadingState {
                case .loading:
                    Text("Loading...")
                case .loaded:
                    ScrollView {
                        VStack {
                            AsyncImage(url: URL(string: pages[0].thumbnail.source)) { image in
                                image
                                    .resizable()
                                    .scaledToFill()
                            } placeholder: {
                                ProgressView()
                            }
                            .frame(width: 350, height: 190)
                            .clipShape(RoundedRectangle(cornerRadius: 15.0, style: .continuous))
                            
                            VStack(alignment: .leading) {
                                
                                RectangleView()
                                
                                Text("\(pages[0].extract)")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .navigationTitle(pages[0].title)
                    .navigationBarTitleDisplayMode(.inline)
                    .background(.darkBackground)
                case .failed:
                    Text("Please try again later.")
                }
            }
        }
    }
    
    func fetchCarData() async {
        let urlString = "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=pageimages%7Cextracts&pageids=\(selectedCar)&formatversion=2&pithumbsize=1000&exintro=1&explaintext=1"
        
        guard let url = URL(string: urlString) else {
            print("Bad URL: \(urlString)")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let items = try JSONDecoder().decode(Result.self, from: data)
            pages = items.query.pages
            loadingState = .loaded
        } catch {
            loadingState = .failed
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
