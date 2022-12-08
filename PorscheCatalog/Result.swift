//
//  Result.swift
//  PorscheCatalog
//
//  Created by Carlos Vinicius on 07/12/22.
//

import Foundation

struct Result: Codable {
    let batchcomplete: Bool
    let query: Query
}

struct Query: Codable {
    let pages: [Pages]
}

struct Pages: Codable, Comparable {
    let pageid: Int
    let ns: Int
    let title: String
    let extract: String
    
    static func <(lhs: Pages, rhs: Pages) -> Bool {
        lhs.title < rhs.title
    }
}
