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

struct Pages: Codable, Comparable, Hashable {
    let pageid: Int
    let ns: Int
    let title: String
    let thumbnail: Thumbnail
    let pageimage: String
    let extract: String
    
    static func <(lhs: Pages, rhs: Pages) -> Bool {
        lhs.title < rhs.title
    }
}

struct Thumbnail: Codable, Comparable, Hashable {
    let source: String
    let width: Int
    let height: Int
    
    static func <(lhs: Thumbnail, rhs: Thumbnail) -> Bool {
        lhs.width < rhs.width
    }
}
