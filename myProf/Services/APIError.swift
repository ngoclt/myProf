//
//  APIServiceError.swift
//  myProf
//
//  Created by Ngoc Le on 19.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Foundation

enum APIError: Error {
    case unknown
    case network(description: String)
    case parsing(description: String)
    case server(statusCode: Int)
    
    var localizedDescription: String {
        switch self {
        case .unknown:
            return "Unknown error!"
        case .network(let description):
            return description
        case .parsing(let description):
            return description
        case .server(let statusCode):
            return "Server error with status code: \(statusCode)"
        }
    }
}
