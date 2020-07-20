//
//  SettingsView.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 7/11/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewRouter: ViewRouter
    var body: some View {
        VStack{
            List{
                Button(action: {
                    // TODO Change view to speaker
                }){
                    SettingsItem(text: "Manage Speakers", icon: "person.crop.circle.badge.plus")
                }
                Button(action: {
                    // TODO Change view to manage talks view
                }){
                    SettingsItem(text: "Manage talks", icon: "pencil.and.outline")
                }
                Button(action: {
                    // TODO Change view to apply view
                }){
                    SettingsItem(text: "Apply to speak!.. Soon", icon: "text.cursor")
                }
                Button(action: {
                    signOut()
                    self.viewRouter.currentPage = "Login"
                }){
                    SettingsItem(text: "LogOut", icon: "lock.slash")
                }
                
            }.listStyle(GroupedListStyle())
            
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewRouter: ViewRouter())
    }
}
