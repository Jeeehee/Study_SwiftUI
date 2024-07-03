//
//  LandmarkListView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct LandmarkListView: View {
    var body: some View {
        NavigationView {
            List(landmarks, id: \.id) { landmark in
                NavigationLink {
                    LandmarkDetailView(landmark: landmark)
                } label: {
                    LandmarkRow(landmark: landmark)
                }
            }
            .navigationTitle("Landmarks")
        }
    }
}

#Preview {
    LandmarkListView()
}
