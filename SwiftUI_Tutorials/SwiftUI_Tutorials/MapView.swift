//
//  MapView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

import MapKit

struct MapView: View {
    
    @State private var region = MKCoordinateRegion(
        center: .init(latitude: 37.521624, longitude: 126.924191),
        span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
}

#Preview {
    MapView()
}
