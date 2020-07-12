//
//  ContentView.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import SwiftUI

let lightGreyColor = Color(red: 239.0/255.0, green: 243.0/255.0, blue: 244.0/255.0, opacity: 1.0)
let backColor = Color(.black)


struct MainView: View {
    
    @ObservedObject var viewRouter: ViewRouter
    
    var body: some View {
        VStack {
//
            if viewRouter.currentPage == "Login" {
                LoginView(viewRouter: viewRouter)
            }
            else if viewRouter.currentPage == "Signup" {
                SignupView(viewRouter: viewRouter)
            }
            else {
                HomeView(viewRouter: viewRouter)
            }
        }
    }
}

#if DEBUG
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewRouter: ViewRouter())
    }
}
#endif
