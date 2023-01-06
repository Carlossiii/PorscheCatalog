//
//  ContentView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 07/12/22.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.scenePhase) var scenePhase
    
    @State private var offset: CGFloat = 0
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ListView(classifier: classifier), label: {
                ZStack {
                    
                    BgdFullScreenVideoView(videoName: "porsche")
                        .overlay(Color.black.opacity(0.5))
                    
                    VStack {
                        
                        Spacer()
                        
                        Image("logo")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 200, height: 250)
                            .padding()
                        
                        Spacer()
                        
                        Text("Tap to reveal")
                            .padding(.vertical)
                            .fontDesign(.monospaced)
                            .font(.title)
                            .addGlowEffect(color1: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1), color2: Color(Color.RGBColorSpace.sRGB, red: 238/255, green: 50/255, blue: 50/255, opacity: 1), color3: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1))
                            .offset(y: offset)
                            .onAppear {
                                withAnimation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: true)) {
                                    self.offset = -10
                                }
                            }
                    }
                }
            })
            .simultaneousGesture(TapGesture().onEnded {
                simpleSuccess()
            })
        }
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
