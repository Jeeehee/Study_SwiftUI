//
//  ContentView.swift
//  SwiftUI_Tutorials
//
//  Created by Jihee hwang on 7/2/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            MapView()
                .frame(height: 300)
            
            ImageView()
                .offset(y: -100)
                .padding(.bottom, -80)
            
            Text("Hello SwiftUI!")
                .font(.title)
            
            HStack {
                Text("비가 너무 많이와ㅏ..")
                    .font(.subheadline)
            }
        }
        
        Spacer()
    }
}

#Preview {
    ContentView()
}
