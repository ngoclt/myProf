//
//  APIService.swift
//  myProf
//
//  Created by Ngoc Le on 19.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Foundation
import Combine

protocol APIRequestType {
    associatedtype Response: Decodable
    
    var path: String { get }
    var method: APIHttpMethod { get }
    var queryItems: [URLQueryItem]? { get }
    var body: [String: Any]? { get }
}

protocol APIServiceType {
    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIError> where Request: APIRequestType
}

final class APIService: APIServiceType {
    
    private let baseURL: URL
    private let session: URLSession
    
    init(baseURL: URL = URL(string: "http://localhost:8080")!,
         session: URLSession = .shared) {
        self.baseURL = baseURL
        self.session = session
    }

    func response<Request>(from request: Request) -> AnyPublisher<Request.Response, APIError> where Request: APIRequestType {
    
        let pathURL = URL(string: request.path, relativeTo: baseURL)!
        
        var urlComponents = URLComponents(url: pathURL, resolvingAgainstBaseURL: true)!
        urlComponents.queryItems = request.queryItems
        
        var urlRequest = URLRequest(url: urlComponents.url!)
        urlRequest.httpMethod = request.method.rawValue
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if let body = request.body {
            urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: body, options: [])
        }
        
        let decorder = JSONDecoder()
        return session.dataTaskPublisher(for: urlRequest)
            .mapError { error in
                APIError.network(description: error.localizedDescription)
            }
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw APIError.unknown
                }
                
                guard (200..<300).contains(response.statusCode) else {
                    throw APIError.server(statusCode: response.statusCode)
                }
                
                return output.data
            }
            .decode(type: Request.Response.self, decoder: decorder)
            .mapError { error in
                if let apiError = error as? APIError {
                    return apiError
                }
                
                return APIError.parsing(description: error.localizedDescription)
            }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
}
