//
//  router.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Combine
import Foundation
import Amplify

func initialRoute() -> String {
    return isUserLoged() ? "Home" : "Login"
}


class ViewRouter: ObservableObject {
    let objectWillChange = PassthroughSubject<ViewRouter, Never>()

    var currentPage: String = initialRoute() {
        didSet {
            objectWillChange.send(self)
        }
    }
}
