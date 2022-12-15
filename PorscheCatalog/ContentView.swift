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
    
    @State private var cars: [Car] = [.category356, .category911]
    @State private var selectedCar = 0
    
    var body: some View {
        NavigationStack {
            Form {
                List(cars, children: \.items) { item in
                    HStack {
                        Button(item.name){
                            selectedCar = item.pageId
                            Task {
                                await fetchNearbyPlaces()
                            }
                        }
                    }
                }
                Section("Information about selected model:") {
                    switch loadingState {
                    case .loading:
                        Text("Loading...")
                    case .loaded:
                        AsyncImage(url: URL(string: pages[0].thumbnail.source))
                        Text("\(pages[0].extract)")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Porsche Catalog")
        }
    }
    
    func fetchNearbyPlaces() async {
        
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
