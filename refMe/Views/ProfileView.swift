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
        BaseView() {
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
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

