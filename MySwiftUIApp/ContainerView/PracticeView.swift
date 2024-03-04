//
//  PracticeView.swift
//  MySwiftUIApp
//
//  Created by User on 26/02/24.
//

import SwiftUI

struct PracticeView: View {
    @Environment(\.presentationMode) var presentationMode
    var text1 = "Durga"
    var text2 = "praveen"
    var text3 = ""
    var text4 = "mohit"
    var body: some View {
        VStack {
            VStack {
                Text(text1)
                Text(text2)
                Text(text3)
                Text(text4)
            }
            .frame(width: 300)
            .background(Color.green.opacity(0.4))
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 10)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.gray.opacity(0.11))
        .topNavBar(navBarTitle: "Practice page", backButtonAction: 
                    { presentationMode.wrappedValue.dismiss()} )
    }
}

#Preview {
    PracticeView()
}
