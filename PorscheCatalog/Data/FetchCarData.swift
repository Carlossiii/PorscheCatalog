//
//  FetchCarData.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 21/12/22.
//

import Foundation

@MainActor
class CarData: ObservableObject {
    
    enum LoadingState {
        case loading, loaded, failed
    }
    
    @Published var loadingState = LoadingState.loading
    var pages = [Pages]()
    
    var selectedCar = 0
    
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
