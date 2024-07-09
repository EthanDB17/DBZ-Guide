//
//  AppError.swift
//  DBZ-Guide
//
//  Created by Ethan Borrowman on 7/8/24.
//

import Foundation

struct AppError: Error {
    let errorType: ErrorType
    
    var message: String {
        return errorType.stringValue
    }
    
    enum ErrorType {
        
        // Types
        case apiError(message: String)
        
        // Error Message Value
        var stringValue: String {
            switch self {
            case .apiError(let message): return message
            }
        }
    }
}
