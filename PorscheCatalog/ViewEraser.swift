//
//  ViewEraser.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 22/12/22.
//

import SwiftUI

extension View {
    func eraseToAnyView() -> AnyView {
        AnyView(self)
    }
}
