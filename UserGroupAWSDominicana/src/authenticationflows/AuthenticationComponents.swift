//
//  main.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI
import Amplify

func login() {
    _ = Amplify.Auth.fetchAuthSession { result in
        switch result {
        case .success(let session):
            print("Is user signed in - \(session.isSignedIn)")
        case .failure(let err):
            print("Fetch session failed with error \(err)")
        }
        
    }
}

func signIn(username: String, password: String) {
    _ = Amplify.Auth.signIn(username: username, password: password) { result in
        switch result {
        case .success(_):
            print("Sign in succeded")
        case .failure(let error):
            print("Sign in failed \(error)")
        }
    }
}


struct UserTextBox: View {
    @State var username: String = ""
    var hoverText: String = ""
    
    var body: some View {
        return TextField(hoverText, text: $username)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
    }
}

struct UserPasswordBox: View {
    
    @State var password: String = ""
    var hoverText: String = ""
    
    var body: some View {
        return SecureField(hoverText, text: $password)
        .padding()
        .background(lightGreyColor)
        .cornerRadius(5.0)
        .padding(.bottom, 5)

    }
}

struct AuthenticationButtonContent: View {
    var text: String!
    var body: some View {
        return Text(text)
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 120, height: 35)
            .background(Color.blue)
            .cornerRadius(10.0)
            .padding()
    }
}

// SignUp logic

func signUp(username: String, password: String, email: String) {
    let userAttributes = [AuthUserAttribute(.email, value: email)]
    let options = AuthSignUpRequest.Options(userAttributes: userAttributes)
    
    _ = Amplify.Auth.signUp(username: username, password: password, options: options) { result in
        switch result {
        case .success(let signUpResult):
            if case let .confirmUser(deliveryDetails, _) = signUpResult.nextStep {
                print("Delivery details \(String(describing: deliveryDetails))")
            }
        case .failure(let error):
            print("An error ocurred with registering the user \(error)")
        }
        
    }
}

func confirmSignUp(for username: String, with confirmationCode: String) {
    _ = Amplify.Auth.confirmSignUp(for: username, confirmationCode: confirmationCode) { result in
        switch result {
        case .success(_):
            print("Confirm signUp succeded")
        case .failure(let error):
            print("An error ocurred while registering a user \(error)")
            
        }
    }
}
