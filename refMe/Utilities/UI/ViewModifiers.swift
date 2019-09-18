//
//  ViewModifiers.swift
//  refMe
//
//  Created by Ngoc Le on 17.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct FormStyle: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .frame(minWidth: 100, maxWidth: .infinity, minHeight: 44)
    }
}

extension View {
    func formStyle() -> some View {
        ModifiedContent(content: self, modifier: FormStyle())
    }
}

