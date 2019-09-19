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
    
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    
    @ObservedObject var viewModel: SignUpViewModel
    
    var body: some View {
        BaseView() {
            VStack (alignment: .center, spacing: 10) {
                Spacer()
                
                Image("Logo")
                
                Group {
                    IconTextField(
                        image: Image(systemName: "person"),
                        placeholder: "name",
                        text: self.$name
                    )
                    
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
                    
                    IconTextField(
                        image: Image(systemName: "lock"),
                        placeholder: "confirm password",
                        isPassword: true,
                        text: self.$confirmPassword
                    )
                }
                .formStyle()
                
                Button(action: {
                    self.viewModel.apply(.onSubmit(name: self.name, email: self.email, password: self.password, confirmPassword: self.confirmPassword))
                }) {
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
        }
        .alert(isPresented: $viewModel.isErrorShown) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
        }
        
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView(viewModel: SignUpViewModel())
    }
}

