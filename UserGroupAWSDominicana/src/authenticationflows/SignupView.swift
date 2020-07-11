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
    @State var toVerify: Bool = false
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var email = Observable()
    @ObservedObject var username = Observable()
    @ObservedObject var password = Observable()
    
    var body: some View {
        VStack {

            if toVerify == false {
                WelcomeHeader(text: "SignUp")
                UserTextBox(username: self.email, hoverText: "email")
                UserTextBox(username: self.username, hoverText: "username")
                UserPasswordBox(password: self.password, hoverText: "password")
                Button(action: {
                    signUp(username: self.username.value, password: self.password.value, email: self.email.value)
                    self.toVerify = true
                }){
                    AuthenticationButtonContent(text: "signup")
                }
                Button(action: {self.viewRouter.currentPage = "Login"}) {
                     Text("Back to login!")
                        .foregroundColor(.gray)
                }
            } else {
                SignupConfirmationView(user: self.username, viewRouter: self.viewRouter)
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
