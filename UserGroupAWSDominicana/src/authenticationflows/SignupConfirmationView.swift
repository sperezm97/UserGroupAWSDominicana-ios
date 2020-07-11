//
//  SignupConfirmationView.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 7/11/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct SignupConfirmationView: View {
    @ObservedObject var user = ObservableString()
    @ObservedObject var code = ObservableString()
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            WelcomeHeader(text: "Verification")
            UserTextBox(username: self.code , hoverText: "code")
            Button(action: {
                confirmSignUp(for: self.user.value, with: self.code.value)
                self.viewRouter.currentPage = "Home"
            }) {
                AuthenticationButtonContent(text: "Confirm")
                    .foregroundColor(.gray)
            }
            Button(action: {
                self.viewRouter.currentPage = "Signup"
            }) {
                Text("Back to signup!")
                    .foregroundColor(.gray)
            }

        }
    }
}

struct SignupConfirmationView_Previews: PreviewProvider {
    static var previews: some View {
        SignupConfirmationView(viewRouter: ViewRouter())
    }
}
