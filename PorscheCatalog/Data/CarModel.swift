//
//  CarModel.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 08/12/22.
//

import Foundation

struct Car: Identifiable, Hashable {
    
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
    
    static let boxter986 = Car(name: "986", pageId: 606167)
    static let boxter987 = Car(name: "987", pageId: 969009)
    static let boxter981 = Car(name: "981", pageId: 38908804)
    static let boxter982 = Car(name: "982", pageId: 57804620)
    
    // groups
    static let porsche356 = Car(name: "356", pageId: 24626)
    static let category911 = Car(name: "911", pageId: 48345830, items: [Car.nineElevenClassic, Car.nineEleven930, Car.nineEleven964, Car.nineEleven993, Car.nineEleven996, Car.nineEleven997, Car.nineEleven991, Car.nineEleven992])
    static let porscheGT1 = Car(name: "911 GT1", pageId: 1008348)
    static let porsche912 = Car(name: "912", pageId: 24377)
    static let porsche914 = Car(name: "914", pageId: 37419)
    static let porsche918 = Car(name: "918 Spyder", pageId: 26458686)
    static let porsche924 = Car(name: "924", pageId: 24366)
    static let porsche928 = Car(name: "928", pageId: 23972)
    static let porsche944 = Car(name: "944", pageId: 24375)
    static let porsche959 = Car(name: "959", pageId: 355927)
    static let porsche968 = Car(name: "968", pageId: 24376)
    static let categoryBoxter = Car(name: "Boxter", pageId: 48781658, items: [Car.boxter986, Car.boxter987, Car.boxter981, Car.boxter982])
    static let porscheCarreraGT = Car(name: "Carrera GT", pageId: 488804)
    static let categoryCayman = Car(name: "Cayman", pageId: 48781658, items: [Car.boxter987, Car.boxter981, Car.boxter982])
    static let porscheCayenne = Car(name: "Cayenne", pageId: 148952)
    static let porscheMacan = Car(name: "Macan", pageId: 28972217)
    static let porschePanamera = Car(name: "Panamera", pageId: 1755878)
    static let porscheTaycan = Car(name: "Taycan", pageId: 50428355)
    
}
