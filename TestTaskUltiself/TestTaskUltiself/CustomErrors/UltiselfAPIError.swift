//
//  UltiselfAPIError.swift
//  TestTaskUltiself
//
//  Created by Bohdan Dankovych on 25.12.2020.
//

import Moya

enum UltiselfAPIError: Swift.Error, CustomStringConvertible, LocalizedError {
    case apiError(message: String)
    case networkError(MoyaError)
    
    var description: String {
        switch self {
        case .apiError(let message):
            return message
        case .networkError(let error):
            return error.localizedDescription
        }
    }
    
    public var errorDescription: String? {
        description
    }
}
