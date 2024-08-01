//
//  Character.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation

struct Character: Codable {
    let id: Int
    let name: String
    let ki: String
    let maxKi: String
    let race: String
    let description: String
    let image: String
    let affiliation: String
    let originPlanet: Planet?
    let transformations: [Transformation]?
}
