//
//  NavigationBarView.swift
//  MySwiftUIApp
//
//  Created by User on 13/02/24.
//

import SwiftUI

extension View {
    public func topNavBar(navBarTitle: String, backButtonAction: @escaping() -> Void) -> some View {
        modifier(NavigationBarView(navBarTitle: navBarTitle, backButtonAction: backButtonAction))
    }
}
struct NavigationBarView: ViewModifier {
    var navBarTitle: String
    var backButtonAction: () -> Void
    func body(content: Content) -> some View {
        VStack(spacing: 0) {
            HStack(alignment: .center, spacing: 6) {
                Button(action: backButtonAction) {
                    Image(systemName: "chevron.backward")
                        .frame(width: 24, height: 24)
                }
                Text(navBarTitle)
                Spacer()
            }
            .padding(.leading, 10)
            .frame(maxWidth: .infinity)
            .frame(height: 40)
            //            .background(Color.red.opacity(0.15))
            .background(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xF09819), Color(hex: 0xFF512F)]), startPoint: .leading, endPoint: .trailing)) // Apply gradient background
            content
                .navigationBarHidden(true)
        }
    }
}


