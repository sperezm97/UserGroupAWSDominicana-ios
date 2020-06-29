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
    
    @State var password: String = ""
    @State var firstTime: Bool = true
    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
        VStack {
            WelcomeHeader()
            if !firstTime {
                UserImage()
            }
            UserTextBox(username: "", hoverText: "username")
            UserPasswordBox(password: "", hoverText: "password")

            Button(action: {self.viewRouter.currentPage = "Login"}) {
                LoginButtonContent()
            }
            Button(action: {self.viewRouter.currentPage = "Home"}) {
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
