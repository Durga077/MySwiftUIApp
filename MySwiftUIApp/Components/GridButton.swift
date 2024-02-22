//
//  GridButton.swift
//  MySwiftUIApp
//
//  Created by User on 14/02/24.
//

import SwiftUI

struct GridButton: View {
    var image: String
    
    var body: some View {
        Button {
            print("Grid Button Pressed")
        } label: {
            Image(systemName: image)
                .resizable()
                .frame(width: 30, height: 30)
                .foregroundColor(Color(hex: 0x988A7D).opacity(0.5))
            //                .aspectRatio(contentMode: .fit)
                .background(Color.white)
            //                .cornerRadius(8)
            //                .shadow(radius: 10)
        }
        .frame(width: 125, height: 120)
        .background(Color.white)
    }
}

#Preview {
    GridButton(image: "bus")
}
