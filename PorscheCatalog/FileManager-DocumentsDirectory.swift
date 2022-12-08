//
//  FileManager-DocumentsDirectory.swift
//  BucketList
//
//  Created by Carlos Vinicius on 25/10/22.
//

import Foundation

extension FileManager {
    static var documentsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}
