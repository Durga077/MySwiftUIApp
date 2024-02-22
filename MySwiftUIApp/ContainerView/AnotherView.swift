//
//  AnotherView.swift
//  MySwiftUIApp
//
//  Created by User on 13/02/24.
//

import SwiftUI

struct AnotherView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentIndex = 0
    let images = ["bus", "car", "bicycle", "tram"]
    let gridImages = ["bus", "car", "bicycle", "tram", "airplane", "bus", "bus", "bicycle", "bus", "car", "bicycle", "bus"]
    var body: some View {
        VStack {
            carousalView()
                .padding(.bottom, 10)
            Text("New View")
                .padding(.bottom, 10)
            LazyVGrid(columns:Array(repeating: GridItem(.flexible(),spacing: 1), count: 3), spacing: 1) {
                ForEach(gridImages.indices, id: \.self) { index in
                    GridButton(image: gridImages[index])
                }
            }
            .padding(6)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color(hex: 0x988A7D).opacity(0.5))
        .topNavBar(navBarTitle: "Grid View", backButtonAction: {presentationMode.wrappedValue.dismiss()})
    }
    func carousalView() -> some View {
        GeometryReader { geometry in
            ZStack {
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(images.indices, id: \.self) { index in
                            Image(systemName: images[index])
                                .resizable()
                                .frame(width: 250, height: 150)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: geometry.size.width, height: geometry.size.height)
                                .background(Color.yellow.opacity(0.15))
                        }
                    }
                }
                .content.offset(x: CGFloat(currentIndex) * -geometry.size.width)
                .frame(width: geometry.size.width, alignment: .leading)
                .onAppear {
                    let timer = Timer.scheduledTimer(withTimeInterval: 4, repeats: true) { _ in
                        withAnimation {
                            currentIndex = (currentIndex + 1) % images.count
                        }
                    }
                    RunLoop.main.add(timer, forMode: .common)
                }
                .gesture(
                    DragGesture()
                        .onEnded { value in
                            withAnimation {
                                if value.translation.width < 0 {
                                    currentIndex = min(currentIndex + 1, images.count - 1)
                                } else {
                                    currentIndex = max(currentIndex - 1, 0)
                                }
                            }
                        }
                )
                HStack{
                    ForEach(images.indices, id: \.self) {  index in
                        Circle()
                            .fill(index == currentIndex ? Color.white : Color.black)
                            .frame(width: 5, height: 5)
                    }
                }
                .offset(x: 0, y: 90)
            }
        }
    }
}
#Preview {
    AnotherView()
}
