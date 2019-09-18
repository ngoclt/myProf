//
//  IconTextField.swift
//  refMe
//
//  Created by Ngoc Le on 16.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

public struct IconTextField: View {
    
    var image: Image
    var placeholder: String = ""
    var keyboardType: UIKeyboardType = .default
    var isPassword: Bool = false
    
    @Binding var text: String
    
    public var body: some View {
        VStack {
            HStack {
                image
                
                if !isPassword {
                    TextField(placeholder, text: $text)
                        .padding(5)
                        .keyboardType(keyboardType)
                } else {
                    SecureField(placeholder, text: $text)
                        .padding(5)
                        .keyboardType(keyboardType)
                }
            }
            
            Divider()
                .foregroundColor(Color.gray)
        }
    }

}

struct IconTextField_Preview: PreviewProvider {
    
    @State static var text: String = ""
    
    static var previews: some View {
        IconTextField(
        image: Image(systemName: "person"),
        text: $text)
    }
}
