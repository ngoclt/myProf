//
//  User.swift
//  refMe
//
//  Created by Ngoc Le on 19.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Foundation

struct User: Codable {
    
    static let unregistered = User(name: "", email: "")
    
    let name: String
    let email: String
}
