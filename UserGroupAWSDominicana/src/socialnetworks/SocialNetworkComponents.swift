//
//  SocialNetworkComponents.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct SocialNetworkItem: View {
    var text: String = ""
    var link: String = ""

    var body: some View {
        Button(self.text){
            UIApplication.shared.open(URL(string: self.link)!)
        }.padding()
    }
}

struct SocialNetworkItem_Preview: PreviewProvider {
    static var previews: some View {
        SocialNetworkItem()
    }
}
