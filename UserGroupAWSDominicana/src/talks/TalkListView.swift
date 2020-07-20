//
//  TalkListView.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct TalkListView: View {
    var Talks: [Talk]
    var body: some View {
        
        return List {
            ForEach(Talks, id: \.id) {result in
                VStack {
                    // TODO: DRY; Modeify the boolean on the if and assign it after
                    if (strToDate(talkItem: result) ?? Date() > Date()){
                       NavigationLink(destination: TalkDetailsView(talkItem: result)){
                               TalkItem(talkItem: result)
                       }
                   } else {
                        NavigationLink(destination: TalkDetailsView(talkItem: result)){
                            TalkItem(talkItem: result)
                        }.disabled(true)
                    }
                }
            }
        }
    }
}

struct TalkListView_Previews: PreviewProvider {
    static var previews: some View {
        TalkListView(Talks: [
            Talk(
                name: "Swift on lambda",
                date: "01/01/01",
                speaker: Speaker(
                    id: "01",
                    name: "Nicki Stone"
                )
            ),
            Talk(
                name: "Swift on lambda",
                date: "01/01/01",
                speaker: Speaker(
                    id: "01",
                    name: "Nicki Stone"
                )
            )
        ])
    }
}
