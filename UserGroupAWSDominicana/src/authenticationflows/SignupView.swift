//
//  SignupView.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 7/11/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI


struct SignupView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack {
            WelcomeHeader(text: "SignUp")
            UserTextBox(username:"", hoverText: "email")
            UserTextBox(username: "", hoverText: "username")
            UserPasswordBox(password: "", hoverText: "password")

            Button(action: login) {
                AuthenticationButtonContent(text: "signup")
            }
            Button(action: {self.viewRouter.currentPage = "Login"}) {
                Text("login")
                   .foregroundColor(.gray)
           }
        }
        .padding()
    }
}


struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView(viewRouter: ViewRouter())
    }
}
