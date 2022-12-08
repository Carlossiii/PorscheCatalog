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
    
    var body: some View {
        NavigationView {
            Form {
                Section("Porsche 356") {
                    switch loadingState {
                    case .loading:
                        Text("Loading")
                    case .loaded:
                        Text("\(pages[0].extract)")
                    case .failed:
                        Text("Please try again later.")
                    }
                }
            }
            .navigationTitle("Porsche Catalog")
            .task {
                await fetchNearbyPlaces()
            }
        }
    }
    
    func fetchNearbyPlaces() async {
        
        let urlString = "https://en.wikipedia.org/w/api.php?action=query&format=json&prop=extracts&titles=Porsche%20356&formatversion=2&exintro=1&explaintext=1"
        
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
