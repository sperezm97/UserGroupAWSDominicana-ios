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
    @ObservedObject var MoveToConfirmationStep = ObservableBool()
    @ObservedObject var email = ObservableString()
    @ObservedObject var username = ObservableString()
    @ObservedObject var password = ObservableString()
    
    var body: some View {
        VStack {

            if MoveToConfirmationStep.value == false {
                GatherUserDataView(
                    viewRouter: self.viewRouter,
                    toVerify: self.MoveToConfirmationStep,
                    email: self.email,
                    username: self.username,
                    password: self.password
                )
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
