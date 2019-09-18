//
//  ContentView.swift
//  refMe
//
//  Created by Ngoc Le on 16.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var password: String = ""
    @State private var email: String = ""
    
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
            
                Button(action: { }) {
                    Text("Login")
                }
                .accentColor(.red)
                .buttonStyle(RoundedStyle())
                
                HStack {
                    Spacer()
                    Text("Don't have account yet?")
                    Button(action: { }, label: { Text("Signup").font(.headline) })
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
