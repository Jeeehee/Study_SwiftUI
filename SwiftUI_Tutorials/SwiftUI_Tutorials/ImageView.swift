//
//  ImageView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        Image("Image")
            .resizable()
            .clipShape(.circle)
            .frame(width: 200, height: 200)
            .scaledToFill()
    }
}

#Preview {
    ImageView()
}
