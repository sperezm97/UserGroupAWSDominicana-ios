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

func listTalks() -> [Talk] {
    let group = DispatchGroup()
    var talks = [Talk]()
    group.enter()
    
    DispatchQueue.global().async {
        _ = Amplify.API.query(request: .list(Talk.self)) { event in
            switch event {
            case .success(let result):
                switch result {
                case .success(let talk):
                    talks = talk
                    group.leave()
                case .failure(let error):
                    print("fail \(error.errorDescription)")
                    group.leave()
                }
            case .failure(let error):
                print("Got failed event with error \(error)")
                group.leave()
            }
            
        }
    }
    group.wait()
    
    return talks
}

