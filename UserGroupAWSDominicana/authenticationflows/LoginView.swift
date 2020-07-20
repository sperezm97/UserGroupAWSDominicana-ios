//
//  view.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct LoginView: View {
    
    
    @State var firstTime: Bool = true
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var username = ObservableString()
    @ObservedObject var password = ObservableString()

    var body: some View {
        VStack {
            WelcomeHeader()
            if !firstTime {
                UserImage()
            }
            UserTextBox(username: self.username, hoverText: "username")
            UserPasswordBox(password: self.password, hoverText: "password")

            Button(action: {
                let wasSignIn = signIn(
                    username: self.username.value,
                    password: self.password.value
                )
                if wasSignIn {
                    self.viewRouter.currentPage = "Home"
                }

            }) {
                AuthenticationButtonContent(text: "login")
            }
            Button(action: {self.viewRouter.currentPage = "Signup"}) {
                Text("Sign Up")
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}

struct view_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(viewRouter: ViewRouter())
    }
}
