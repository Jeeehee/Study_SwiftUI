//
//  MapView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    
    @State private var region: MKCoordinateRegion
    
    init(coordinate: CLLocationCoordinate2D) {
        self.coordinate = coordinate
        self.region = MKCoordinateRegion(
            center: coordinate,
            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    }
    
    var body: some View {
        Map(coordinateRegion: $region)
    }
    
}

#Preview {
    MapView(coordinate: .init(latitude: 37.521624, longitude: 126.924191))
}
