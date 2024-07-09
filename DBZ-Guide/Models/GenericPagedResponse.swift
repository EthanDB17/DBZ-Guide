//
//  GenericPagedResponse.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation

struct GenericPagedResponse<T: Decodable>: Decodable {
    let items: [T]
    let meta: PageData
}

struct PageData: Decodable {
    let totalItems: Int
    let currentPage: Int
    let totalPages: Int
}
