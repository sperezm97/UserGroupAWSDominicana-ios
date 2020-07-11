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

struct WelcomeHeader: View {
    var text: String?

    var body: some View {
        return Text(text ?? "Welcome")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding(.bottom, 10)
    }
}

class ObservableString: ObservableObject {
    @Published var value: String = ""
}

class ObservableBool: ObservableObject {
    @Published var value: Bool = false
}

struct GlobalComponents_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            UserImage()
            WelcomeHeader()
            WelcomeHeader(text: "Test")
        }
    }
}
