//
//  TalkModel.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/29/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation

struct Talk: Codable {
    var id: UUID = UUID()
    var talkTitle: String
    var talkDesc: String? = ""
    var talkAuthors: String
    var talkDate: String?
    private enum CodingKeys: String, CodingKey {
           case talkTitle, talkDesc, talkAuthors, talkDate
       }
}
