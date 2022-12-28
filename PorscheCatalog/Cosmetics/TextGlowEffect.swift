//
//  TextGlowEffect.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 22/12/22.
//

import SwiftUI

extension View {
func addGlowEffect(color1:Color, color2:Color, color3:Color) -> some View {
    self
        .foregroundColor(Color(hue: 0.0, saturation: 0.9, brightness: 1))
        .background {
            self
                .foregroundColor(color1).blur(radius: 0).brightness(0.8)
        }
        .background {
            self
                .foregroundColor(color2).blur(radius: 4).brightness(0.35)
        }
        .background {
            self
                .foregroundColor(color3).blur(radius: 2).brightness(0.35)
        }
        .background {
            self
                .foregroundColor(color3).blur(radius: 12).brightness(0.35)
            
        }
     }
  }
