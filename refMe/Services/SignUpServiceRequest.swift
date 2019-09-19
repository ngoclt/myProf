//
//  SignUpServiceRequest.swift
//  refMe
//
//  Created by Ngoc Le on 19.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Foundation

struct SignUpServiceRequest: APIRequestType {
    
    let name: String
    let email: String
    let password: String
    
    typealias Response = User
    
    var path: String { return "/users" }
    
    var method: APIHttpMethod { return .post }
    
    var queryItems: [URLQueryItem]? {
        return nil
    }
    
    var body: [String : Any]? {
        return [
            "name": name,
            "email": email,
            "password": password,
            "verifyPassword": password
        ]
    }
}
