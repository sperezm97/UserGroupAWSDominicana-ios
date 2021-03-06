//
//  view.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct HomeView: View {

    @ObservedObject var viewRouter: ViewRouter

    var body: some View {

        TabView {
            NavigationView {
               TalkListView(Talks: listTalks())
                    .navigationBarTitle("Talks")
                    .listStyle(GroupedListStyle())
            }.tabItem {
                Text("Talks")
                    .font(.system(size: 20))
                    .padding()
                Image(systemName: "list.dash")
            }
            SocialNetworkView()
                .tabItem{
                    Text("Social Networks").padding()
                    Image(systemName: "info")
            }
            SettingsView(viewRouter: self.viewRouter)
            .tabItem{
                Text("Settings").padding()
                Image(systemName: "wrench")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView(viewRouter: ViewRouter())
        }
    }
