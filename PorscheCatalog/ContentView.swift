//
//  ContentView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 07/12/22.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink(destination: ListView(), label: {
                ZStack {
                    
                    PlayerView()
                        .edgesIgnoringSafeArea(.all)
                    
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
                    }
                }
            })
            .simultaneousGesture(TapGesture().onEnded {
                simpleSuccess()
            })
        }
    }
    func simpleSuccess() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
