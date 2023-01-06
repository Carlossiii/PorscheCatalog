//
//  ListView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 04/01/23.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var carData = CarData()
    @State private var searchText = ""
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        TabView {
            NavigationStack {
                List(searchResults, children: \.items) { item in
                    NavigationLink(destination: CarView(carData: carData).onAppear() {
                        carData.selectedCar = item.pageId
                        Task {
                            await carData.fetchCarData()
                        }
                    }) {
                        Text("\(item.name)")
                    }
                    .padding(.vertical, 8)
                    .fontDesign(.monospaced)
                }
                .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
                .listStyle(.plain)
                //.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
            }
            .tabItem {
                Label("Models", systemImage: "list.dash")
            }
            AIView(classifier: classifier)
                .tabItem {
                    Label("AI", systemImage: "camera.metering.multispot")
                }
            InfoView()
                .tabItem {
                    Label("Info", systemImage: "info.square")
                }
        }
        .tint(.darkBackground)
    }
    
    var searchResults: [Car] {
        if searchText.isEmpty {
            return cars
        } else {
            return cars.filter { $0.name.contains(searchText) }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(classifier: ImageClassifier())
    }
}
