//
//  BaseView.swift
//  myProf
//
//  Created by Ngoc Le on 18.9.2019.
//  Copyright © 2019 Coder's Life. All rights reserved.
//

import SwiftUI

struct BaseView<Content>: View where Content: View {
    let content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }

    var body: some View {
        VStack (alignment: .center, spacing: 0) {
            content()
        }
        .background(LinearGradient(
            gradient: Gradient(colors: [Color.white, Color.gray.opacity(0.1)]),
            startPoint: .top,
            endPoint: .bottom)
        )
        .foregroundColor(Color.gray)
        .edgesIgnoringSafeArea(.vertical)
    }
}

struct BaseView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView() {
            Text("Hello world!")
        }
    }
}
