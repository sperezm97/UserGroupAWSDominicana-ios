//
//  SettingsComponents.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 7/11/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct SettingsItem: View {
    var text: String
    var icon: String
    var body: some View {
        return HStack{
            Image(systemName: self.icon)
            Text(self.text).fontWeight(.semibold).foregroundColor(Color(.black))
        }
    }
}

struct SettingsComponents_Previews: PreviewProvider {
    static var previews: some View {
        SettingsItem(text: "LogOut", icon: "lock.slash")
    }
}
