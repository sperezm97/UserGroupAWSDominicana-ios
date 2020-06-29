//
//  GlobalComponents.swift
//  cuantoes?
//
//  Created by Shailyn javier Ortiz jimenez on 6/28/20.
//  Copyright © 2020 Shailyn javier Ortiz jimenez. All rights reserved.
//

import Foundation
import SwiftUI

struct UserImage: View {
    var body: some View {

        return Image(systemName: "person.crop.circle")
            .resizable()
            .aspectRatio(
                UIImage(named: "userImage")!.size,
                contentMode: .fill
            )
            .frame(width: 150, height: 150)
            .clipped()
            .clipShape(Circle())
            .padding(.bottom, 10)
    }
}

struct GlobalComponents_Previews: PreviewProvider {
    static var previews: some View {
        UserImage()
    }
}
