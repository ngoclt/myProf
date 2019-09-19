//
//  UnidirectionalDataFlowType.swift
//  refMe
//
//  Created by Ngoc Le on 19.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import Foundation

protocol UnidirectionalDataFlowType {
    associatedtype InputType
    
    func apply(_ input: InputType)
}
