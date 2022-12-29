//
//  Color-theme.swift
//  Moonshot
//
//  Created by Carlos Vinicius on 22/09/22.
//

import Foundation
import SwiftUI

extension ShapeStyle where Self == Color {
    static var darkBackground: Color {
        Color(red: 0.8, green: 0.1, blue: 0.1)
            .opacity(0.5)
    }

    static var lightBackground: Color {
        Color(red: 0.1, green: 0.1, blue: 0.1)
    }
}
