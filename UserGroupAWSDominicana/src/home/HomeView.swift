//
//  view.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct ResponseData: Decodable {
    var Talks: [Talk]
}

struct Redesview: View {
    var body: some View {
        Text("Hi")
    }
}


struct HomeView: View {
    
    @ObservedObject var viewRouter: ViewRouter

    var body: some View {
        TabView {
            NavigationView{
                TalkListView(Talks: loadJson(filename: "data")!)
                    .navigationBarTitle("Talks")
                    .listStyle(GroupedListStyle())
            }.tabItem{
                Text("Talks")
                    .font(.system(size: 20))
                    .padding()
                Image(systemName: "list.dash")
            }
            Redesview()
                .tabItem{
                    Text("Redes").padding()
                    Image(systemName: "info")
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
            HomeView(viewRouter: ViewRouter())
        }
    }
