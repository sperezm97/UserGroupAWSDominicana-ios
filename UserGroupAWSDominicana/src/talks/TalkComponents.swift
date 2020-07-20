//
//  talkComponents.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

func strToDate(talkItem: Talk) -> Date? {
    if talkItem.date != "" {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        let date = dateFormatter.date(from: talkItem.date)
        return date
    }
    return nil
}

struct TalkItem: View {

    var talkItem: Talk

    var body: some View {
        return HStack(alignment: .center){
            Text(talkItem.name)
                        .fontWeight(.semibold)
                    Spacer()
            Text(talkItem.speaker.name)
        }
        .padding()
        .foregroundColor(Color(.black))
    }
}
