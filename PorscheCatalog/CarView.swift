//
//  CarView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 21/12/22.
//

import SwiftUI

struct CarView: View {
    
    @StateObject var carData: CarData
    
    var body: some View {
        switch carData.loadingState {
        case .loading:
            return ProgressView()
                .eraseToAnyView()
        case .loaded:
            let scroll = ScrollView {
                VStack {
                    AsyncImage(url: URL(string: carData.pages[0].thumbnail.source)) { image in
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
                        
                        Text("\(carData.pages[0].extract)")
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle(carData.pages[0].title)
            .navigationBarTitleDisplayMode(.inline)
            .background(.darkBackground)
            return scroll
                .eraseToAnyView()
        case .failed:
            return Text("Please check your internet connection.")
                .eraseToAnyView()
        }
    }
}
