//
//  ContentView.swift
//  refMe
//
//  Created by Ngoc Le on 16.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    
    @State private var loggedIn: Int? = nil
    
    var body: some View {
        NavigationView {
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
                }
                .formStyle()
            
                NavigationLink(destination: ProfileView(), tag: 1, selection: $loggedIn) {
                    Button(action: { self.loggedIn = 1 }) {
                        Text("Login")
                    }
                    .accentColor(.red)
                    .buttonStyle(RoundedStyle())
                }
                
                HStack {
                    Text("Don't have account yet?")
                    NavigationLink(destination: SignUpView()) {
                        Text("Signup")
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
        }
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
