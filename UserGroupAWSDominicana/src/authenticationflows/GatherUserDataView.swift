//
//  GatherUserDataView.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 7/11/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct GatherUserDataView: View {
    @ObservedObject var viewRouter: ViewRouter
    @ObservedObject var toVerify = ObservableBool()
    @ObservedObject var email = ObservableString()
    @ObservedObject var username = ObservableString()
    @ObservedObject var password = ObservableString()
    
    var body: some View {
        VStack {

            WelcomeHeader(text: "SignUp")
            UserTextBox(username: self.email, hoverText: "email")
            UserTextBox(username: self.username, hoverText: "username")
            UserPasswordBox(password: self.password, hoverText: "password")
            Button(action: {
                signUp(username: self.username.value, password: self.password.value, email: self.email.value)
                self.toVerify.value = true
            }){
                AuthenticationButtonContent(text: "signup")
            }
            Button(action: {self.viewRouter.currentPage = "Login"}) {
                 Text("Back to login!")
                    .foregroundColor(.gray)
            }

        }
        .padding()
    }
}


struct GatherUserDataView_Previews: PreviewProvider {
    static var previews: some View {
        GatherUserDataView(viewRouter: ViewRouter())
    }
}
