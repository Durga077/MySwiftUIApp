//
//  UsersView.swift
//  MySwiftUIApp
//
//  Created by User on 27/02/24.
//

import SwiftUI

struct UsersCardView: View {
    @Environment (\.presentationMode) var presentationMode
    var body: some View {
        VStack { // total view
            VStack { // card view
                HStack {
                    Text("Name")
                        .padding(.leading, 20)
                    Text("-")
                    Spacer()
                    Text("User Name")
                    Text("-")
                }
            }
            .frame(width: 340)
            .background(
                RoundedRectangle(cornerRadius: 4)
                    .fill(Color.white)
                    .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 7)
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .topNavBar(navBarTitle: "Users", backButtonAction: { self.presentationMode.wrappedValue.dismiss()})
    }
}

#Preview {
    UsersCardView()
}
