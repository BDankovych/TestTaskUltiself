//
//  DecodingError.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Foundation

enum DecodingError: Swift.Error, CustomStringConvertible, LocalizedError {
    case decodingFailure(message: String)
    
    var description: String {
        switch self {
        case .decodingFailure(let message):
            return message
        }
    }
    
    public var errorDescription: String? {
        description
    }
}
