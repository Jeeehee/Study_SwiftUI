//
//  LandmarkRow.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct LandmarkRow: View {
    var landmark: Landmark
    
    var body: some View {
        HStack {
            landmark.image
                .resizable()
                .clipShape(.rect(cornerRadius: 10))
                .frame(width: 50, height: 50)
            
            Text(landmark.name)
                .offset(x: 10)
                .padding(.leading, -10)
                .padding(.trailing, 10)
            
            Spacer()
        }
    }
}

#Preview {
    LandmarkRow(landmark: landmarks[0])
}

#Preview("Turtle Rock") {
    LandmarkRow(landmark: landmarks[0])
}

#Preview {
    Group {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
        LandmarkRow(landmark: landmarks[2])
    }
}

#Preview {
    List {
        LandmarkRow(landmark: landmarks[0])
        LandmarkRow(landmark: landmarks[1])
        LandmarkRow(landmark: landmarks[2])
    }
}
