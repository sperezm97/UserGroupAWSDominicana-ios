//
//  main.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct WelcomeHeader: View {
    var body: some View {
        return Text("Welcome!")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
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

struct LoginButtonContent: View {
    var body: some View {
        return Text("Login")
            .font(.headline)
            .foregroundColor(.white)
            .frame(width: 120, height: 35)
            .background(Color.blue)
            .cornerRadius(10.0)
            .padding()
    }
}
