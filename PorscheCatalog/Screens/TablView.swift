//
//  ListView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 04/01/23.
//

import SwiftUI
//import TabBar

struct TablView: View {
    
    enum Item: Int, Tabbable {
        case first = 0
        case second
        case third
        
        var icon: String {
            switch self {
                case .first: return "list.dash"
                case .second: return "camera.metering.multispot"
                case .third: return "info.square"
            }
        }
        
        var title: String {
            switch self {
                case .first: return "Models"
                case .second: return "AI"
                case .third: return "Info"
            }
        }
    }
    
    @State private var selection: Item = .first
    @State private var visibility: TabBarVisibility = .visible
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        
        TabBar(selection: $selection, visibility: $visibility) {
            ListView(classifier: classifier)
                .tabItem(for: Item.first)
            AIView(classifier: classifier, selection: $selection)
                .tabItem(for: Item.second)
            InfoView()
                .tabItem(for: Item.third)
        }
        .tint(.darkBackground)
    }
}

struct TablView_Previews: PreviewProvider {
    static var previews: some View {
        TablView(classifier: ImageClassifier()).environmentObject(SourceOfTruth())
    }
}
