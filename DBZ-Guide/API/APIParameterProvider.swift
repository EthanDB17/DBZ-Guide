//
//  APIParameterProvider.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/9/24.
//

import Foundation

// MARK: - Protocol -

protocol IAPIParameterProvider {
    func provideParameterDictionary(parameters: [Parameter]) -> [String:String]
}

// MARK: - Enum -

enum Parameter {
    case page(page: Int)
}

// MARK: - Struct Implementation -

struct APIParameterProvider: IAPIParameterProvider {
    
    func provideParameterDictionary(parameters: [Parameter]) -> [String:String] {
        var parameterDictionary: [String:String] = [:]
        
        for parameter in parameters {
            switch parameter {
            case .page(let pageNum): parameterDictionary["page"] = "\(pageNum)"
            }
        }
        
        return parameterDictionary
    }
}
