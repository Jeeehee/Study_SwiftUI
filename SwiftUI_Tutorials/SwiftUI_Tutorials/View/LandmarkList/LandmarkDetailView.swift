//
//  LandmarkDetailView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct LandmarkDetailView: View {
    @Environment(\.landmark) var modelData: ModelData
    
    var landmark: Landmark
    
    var landmarkIndex: Int {
        modelData.landmarks.firstIndex(where: { $0.id == landmark.id })!
    }
    
    var body: some View {
        ScrollView {
            MapView(coordinate: landmark.locationCoordinate)
                .frame(height: 300)
            
            ImageView(image: landmark.image)
                .offset(y: -100)
                .padding(.bottom, -80)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(landmark.name)
                        .font(.title)
                    FavoriteButton(isSet: .constant(modelData.landmarks[landmarkIndex].isFavorite))
                }
                
                Text(landmark.name)
                    .font(.title)
                
                HStack {
                    Text(landmark.park)
                    Spacer()
                    Text(landmark.state)
                }
                .font(.subheadline)
                .foregroundColor(.secondary)
                
                Divider()
                
                Text("About \(landmark.name)")
                    .font(.callout)
                
                Text(landmark.description)
                    .font(.footnote)
            }
            .padding()
            
            Spacer()
        }
        
    }
}

#Preview {
    LandmarkDetailView(landmark: ModelData().landmarks[0])
}
