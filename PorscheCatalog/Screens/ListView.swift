//
//  ListView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 21/12/22.
//

import SwiftUI

struct ListView: View {
    
    @State private var cars: [Car] = [.porsche356, .category911, .porscheGT1, .porsche912, .porsche914, .porsche918, .porsche924, .porsche928, .porsche944, .porsche959, .porsche968, .categoryBoxter, .porscheCarreraGT, .categoryCayman, .porscheCayenne, .porscheMacan, .porschePanamera, .porscheTaycan]
    
    @StateObject var carData = CarData()
    
    var body: some View {
        NavigationStack {
            List(cars, children: \.items) { item in
                NavigationLink(destination: CarView(carData: carData).onAppear() {
                    carData.selectedCar = item.pageId
                    Task {
                        await carData.fetchCarData()
                    }
                }) {
                    Text("\(item.name)")
                }
            }
            .navigationBarTitle("Porsche Catalog")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
