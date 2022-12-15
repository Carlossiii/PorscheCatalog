//
//  CarModel.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 08/12/22.
//

import Foundation

struct Car: Identifiable {
    let id = UUID()
    let name: String
    let pageId: Int
    var items: [Car]?
    
    //models
    static let nineElevenClassic = Car(name: "Classic", pageId: 21553360)
    static let nineEleven930 = Car(name: "930", pageId: 561474)
    static let nineEleven964 = Car(name: "964", pageId: 749393)
    static let nineEleven993 = Car(name: "993", pageId: 606179)
    static let nineEleven996 = Car(name: "996", pageId: 642489)
    static let nineEleven997 = Car(name: "997", pageId: 679275)
    static let nineEleven991 = Car(name: "991", pageId: 31795805)
    static let nineEleven992 = Car(name: "992", pageId: 58051494)
    
    
    // groups
    static let category356 = Car(name: "356", pageId: 24626)
    static let category911 = Car(name: "911", pageId: 0, items: [Car.nineElevenClassic, Car.nineEleven930, Car.nineEleven964, Car.nineEleven993, Car.nineEleven996, Car.nineEleven997, Car.nineEleven991, Car.nineEleven992])
    
}
