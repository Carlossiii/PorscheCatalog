//
//  FeedbackGenerator.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 04/01/23.
//

import SwiftUI

func simpleSuccess() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}
