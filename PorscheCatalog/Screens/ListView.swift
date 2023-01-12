//
//  ListView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 10/01/23.
//

import SwiftUI

struct ListView: View {
    
    @StateObject var carData = CarData()
    @EnvironmentObject var truth: SourceOfTruth
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
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
            .searchable(text: $truth.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: "Find your model")
            .listStyle(.plain)
            .padding(.bottom, 50)
        }
        .navigationTitle("Car Models")
        .toolbarBackground(Color.tabsBackground, for: .navigationBar)
        .navigationBarBackButtonHidden(true)
    }
    
    var searchResults: [Car] {
        if self.truth.searchText.isEmpty {
            return cars
        } else {
            return cars.filter { $0.name.contains(self.truth.searchText) }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(classifier: ImageClassifier()).environmentObject(SourceOfTruth())
    }
}
