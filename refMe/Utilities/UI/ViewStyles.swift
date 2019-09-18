//
//  ViewStyles.swift
//  refMe
//
//  Created by Ngoc Le on 17.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

public struct RoundedStyle: ButtonStyle {
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .formStyle()
            .foregroundColor(.white)
            .background(configuration.isPressed ? Color.accentColor.opacity(0.5) : Color.accentColor)
            .cornerRadius(8)
    }
}
