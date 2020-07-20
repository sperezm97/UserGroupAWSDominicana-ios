//
//  components.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI
import Amplify

struct ResponseData: Decodable {
    var Talks: [Talk]
}

func loadJson(filename fileName: String) -> [Talk]? {

    if let url = Bundle.main.url(forResource: fileName, withExtension: "json") {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(ResponseData.self, from: data)
            return jsonData.Talks
        } catch {
            print(error)
        }
    }
    return nil
}
