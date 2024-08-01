//
//  DBZEndpoint.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation

enum DBZEndpoint: Hashable {
    case characters
    case character(id: Int)
    case planets
    case planet(id: Int)
}
