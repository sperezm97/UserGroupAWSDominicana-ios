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

// Signin

func isUserLoged() -> Bool {
    let group = DispatchGroup()
    var sessionExist = false

    group.enter()

    DispatchQueue.global().async {
        
        _ = Amplify.Auth.fetchAuthSession { result in
            switch result {
            case .success(let data):
                sessionExist = data.isSignedIn
                group.leave()

            case .failure(let err):
                print("Fetch session failed with error \(err)")
                group.leave()
            }
        }
    }
    group.wait()
    return sessionExist
}

func signIn(username: String, password: String) -> Bool {

    let group = DispatchGroup()
    var logedIn = false
    group.enter()

    DispatchQueue.global().async {
       _ = Amplify.Auth.signIn(username: username, password: password) { result in
           switch result {
           case .success(_):
               print("Sign in succeeded")
               logedIn = true
               group.leave()
           case .failure(let error):
               print("Sign in failed \(error)")
               group.leave()
           }
       }
    }

    group.wait()

    return logedIn
}

func signOut() {
    // TODO: Refactor to return boolean if the logout worked
    if(isUserLoged()){
        _ = Amplify.Auth.signOut() { result in
            switch result {
            case .success:
                print("Successfully signed out")
            case .failure(let error):
                print("Sign out failed with error \(error)")
            }
        }
    }
}


// -----------------------------
// Signup logic
// -----------------------------
//username: username, password: username, email: username
func signUp(username: String, password: String, email: String){
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

// -----------------------------
// UI components
// -----------------------------

struct UserTextBox: View {
    // TODO: Disable auto capitalization
    // TODO: Add a parameter to control auto capitalization
    // TODO: Add option to disable the field
    @ObservedObject var username = ObservableString()
    var hoverText: String = ""
    
    var body: some View {
        return TextField(hoverText, text: $username.value)
                .padding()
                .background(lightGreyColor)
                .cornerRadius(5.0)
                .padding(.bottom, 20)
    }
}

struct UserPasswordBox: View {
    
    @ObservedObject var password = ObservableString()
    var hoverText: String = ""
    
    var body: some View {
        return SecureField(hoverText, text: $password.value)
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
