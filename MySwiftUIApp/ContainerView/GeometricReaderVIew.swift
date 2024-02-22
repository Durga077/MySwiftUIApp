//
//  GeometricReaderVIew.swift
//  MySwiftUIApp
//
//  Created by User on 20/02/24.
//

import SwiftUI

struct GeometricReaderVIew: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        GeometryReader { geoMetric in
            ZStack {
                VStack {
                    Spacer()
                    Text("Height and width")
                    Text("Geo height: \(geoMetric.size.height/2)")
                    Text("Geo width: \(geoMetric.size.width/2)")
                    Spacer()
                    Text("Position of x and y")
                    Text("Geo Position X: \(geoMetric.frame(in: .global).midX)")
                    Text("Geo Position Y: \(geoMetric.frame(in: .global).midY)")
                    Spacer()
                    // Text("height: \(UIScreen.main.bounds.size.height)")
                    // Text("width: \(UIScreen.main.bounds.size.width)")
                }
                Divider()
                    .background(Color.black)
                    .frame(height: 4)
                    .position(x: 140, y: 190)
            }
            .frame(width: geoMetric.size.width/1.4, height: geoMetric.size.height/2)
            .background(Color.red.opacity(0.7))
            .position(x: geoMetric.size.width/2, y: geoMetric.size.height/2)
            .topNavBar(navBarTitle: "Geometry View", backButtonAction: {presentationMode.wrappedValue.dismiss()}) 
        }
        .background(Color.yellow)
        
    }
}
#Preview {
    GeometricReaderVIew()
}
