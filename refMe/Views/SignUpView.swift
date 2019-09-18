//
//  SignUpView.swift
//  refMe
//
//  Created by Ngoc Le on 18.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct SignUpView: View {
    
    @Environment(\.presentationMode) var presentation
    
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    var body: some View {
        VStack (alignment: .center, spacing: 20) {
            Spacer()
            
            Image("Logo")
            
            Group {
                IconTextField(
                    image: Image(systemName: "person"),
                    placeholder: "email",
                    keyboardType: .emailAddress,
                    text: $email
                )
                
                IconTextField(
                    image: Image(systemName: "lock"),
                    placeholder: "password",
                    isPassword: true,
                    text: $password
                )
                
                IconTextField(
                    image: Image(systemName: "lock"),
                    placeholder: "confirm password",
                    isPassword: true,
                    text: $confirmPassword
                )
            }
            .formStyle()
            
            Button(action: { }) {
                Text("Sign Up")
            }
            .accentColor(.red)
            .buttonStyle(RoundedStyle())
            
            HStack {
                Button(action: { self.presentation.wrappedValue.dismiss() }) {
                    Text("Already have account.")
                        .font(.headline)
                }
            }
            
            Spacer()
        }
        .padding(20)
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
            startPoint: .top,
            endPoint: .bottom)
        )
        .foregroundColor(Color.gray)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

