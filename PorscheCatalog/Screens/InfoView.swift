//
//  InfoView.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 03/01/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Made by Carlos Rodrigues")
                .fontDesign(.monospaced)
                .addGlowEffect(color1: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1), color2: Color(Color.RGBColorSpace.sRGB, red: 238/255, green: 50/255, blue: 50/255, opacity: 1), color3: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1))
            
            Spacer()
            
            Text("2023")
                .fontDesign(.monospaced)
                .addGlowEffect(color1: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1), color2: Color(Color.RGBColorSpace.sRGB, red: 238/255, green: 50/255, blue: 50/255, opacity: 1), color3: Color(Color.RGBColorSpace.sRGB, red: 255/255, green: 50/255, blue: 50/255, opacity: 1))
            
            Spacer()
        }
        .padding(.bottom, 50)
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
