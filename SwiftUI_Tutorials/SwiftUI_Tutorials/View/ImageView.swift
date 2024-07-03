//
//  ImageView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct ImageView: View {
    var image: Image
    
    var body: some View {
        image
            .resizable()
            .clipShape(.circle)
            .frame(width: 200, height: 200)
            .scaledToFill()
            .overlay {
                Circle().stroke(.white, lineWidth: 4)
            }
            .shadow(radius: 7)
    }
}

#Preview {
    ImageView(image: Image("turtlerock"))
}
