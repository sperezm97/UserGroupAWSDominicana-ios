//
//  SocialNetworksView.swift
//  UserGroupAWSDominicana
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct SocialNetworkView: View {
    var body: some View {
        VStack{
            List {
                SocialNetworkItem(
                    text: "Facebook",
                    link: "https://www.facebook.com/groups/awsdominicana/"
                )
                SocialNetworkItem(
                    text: "Telegram",
                    link: "https://t.me/AWSDominicana"
                )
                SocialNetworkItem(
                    text: "Patreon",
                    link: "https://www.patreon.com/root_or_death"
                )
                SocialNetworkItem(
                    text: "Meetup",
                    link: "https://www.meetup.com/es/AWSUserGroupDominicana/"
                )
                
            }.listStyle(GroupedListStyle())
        }
    }
}
