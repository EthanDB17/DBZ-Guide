//
//  EndpointProvider.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation
import APIInteractor

// MARK: - Endpoint Type -

struct Endpoint: APIEndpoint {
    private let baseUrl = "https://dragonball-api.com/api/"
    
    let url: String
    let httpMethod: HttpMethodType
    
    init(url: String, httpMethod: HttpMethodType) {
        self.url = baseUrl + url
        self.httpMethod = httpMethod
    }
}

protocol IEndpointProvider {
    func provideEndpoint(for endpoint: DBZEndpoint) -> Endpoint
}

struct EndpointProvider: IEndpointProvider {
    func provideEndpoint(for endpoint: DBZEndpoint) -> Endpoint {
        switch endpoint {
        case .characters: return Endpoint(url: "characters", httpMethod: .get)
        case .character(let id): return Endpoint(url: "character/\(id)", httpMethod: .get)
        case .planets: return Endpoint(url: "planets", httpMethod: .get)
        case .planet(let id): return Endpoint(url: "planet/\(id)", httpMethod: .get)
        }
    }
}
