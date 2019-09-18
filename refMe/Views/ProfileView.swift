//
//  ProfileView.swift
//  refMe
//
//  Created by Ngoc Le on 18.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
    
    @Environment(\.presentationMode) var presentation
    
    var body: some View {
        NavigationView {
            VStack (alignment: .center, spacing: 20) {
                Spacer()
                
                Image("Logo")
                
                    
                Button(action: { self.presentation.wrappedValue.dismiss() }) {
                    Text("Logout")
                }
                .accentColor(Color.gray.opacity(0.3))
                .foregroundColor(.gray)
                .buttonStyle(RoundedStyle())
                
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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}

