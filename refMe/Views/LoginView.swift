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
            BaseView() {
                VStack (alignment: .center, spacing: 10) {
                    Spacer()
                    
                    Image("Logo")
                    
                    Group {
                        IconTextField(
                            image: Image(systemName: "person"),
                            placeholder: "email",
                            keyboardType: .emailAddress,
                            text: self.$email
                        )
                        
                        IconTextField(
                            image: Image(systemName: "lock"),
                            placeholder: "password",
                            isPassword: true,
                            text: self.$password
                        )
                    }
                    .formStyle()
                
                    NavigationLink(destination: ProfileView(), tag: 1, selection: self.$loggedIn) {
                        Button(action: { self.loggedIn = 1 }) {
                            Text("Login")
                        }
                        .accentColor(.red)
                        .buttonStyle(RoundedStyle())
                    }
                    
                    HStack {
                        Text("Don't have account yet?")
                        NavigationLink(destination: SignUpView(viewModel: SignUpViewModel())) {
                            Text("Signup")
                                .font(.headline)
                        }
                    }
                    
                    Spacer()
                }
                .padding(20)
            }
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
