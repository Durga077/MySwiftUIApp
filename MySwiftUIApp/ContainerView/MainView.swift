//
//  ContentView.swift
//  MySwiftUIApp
//
//  Created by User on 07/02/24.
//

import SwiftUI
enum NavigationNames:String, CaseIterable {
    case pieChart = "Pie Chart"
    case AnotherView = "Another View"
    case view2 = "View 2"
    case view3 = "View 3"
    case view4 = "View 4"
}
struct MainView: View {
    /*  init() {
     // Customize navigation bar appearance
     UINavigationBar.appearance().backgroundColor = UIColor(Color.green.opacity(0.15))
     // Customize statusBar appearance
     if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
     windowScene.statusBarManager?.statusBarStyle = .lightContent
     }
     } */
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    Text("Navigations!")
                        .font(.title)
                        .padding(.vertical ,20)
                    ForEach(NavigationNames.allCases.indices, id: \.self) { index in
                        let name = NavigationNames.allCases[index]
                        NavigationLink(destination: navtoView(containerName: name)) {
                            ButtonView(buttonTitle: name.rawValue, buttonIndex: index)
                        }
                    }
                    .padding(.vertical, 8)
                }
                VStack {
                    Text("sdf")
                        .frame(width: 150, height: 47)
                        .background()
                        .cornerRadius(20, corners: [.topLeft, .topRight])
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color(hex: 0xD3E6ED), Color(hex: 0xEAE4E1)]), startPoint: .leading, endPoint: .trailing)) // Apply gradient background
            .topNavBar(navBarTitle: "Navigation Buttons", backButtonAction: { self.presentationMode.wrappedValue.dismiss()})
        }
    }
}
struct ButtonView: View {
    var buttonTitle: String
    var buttonIndex: Int
    var body: some View {
        //            Button(action: {
        //                print("selected Button is \(buttonTitle) and index is \(buttonIndex)")
        //            }, label: {
        Text(buttonTitle)
            .foregroundColor(.black)
        //            })
            .frame(width: 250,height: 45)
            .background(Color.white)
            .cornerRadius(10)
    }
}
func navtoView(containerName: NavigationNames)-> some View {
    //        guard let viewName = NavigationNames(rawValue: containerName.rawValue) else {
    //            return AnyView(EmptyView())
    //        }
    switch containerName {
    case .pieChart:
        return AnyView(PieChartContainerView())
    case .AnotherView:
        return AnyView(AnotherView())
    case .view2:
        return AnyView(EmptyView())
    case .view3:
        return AnyView(EmptyView())
    case .view4:
        return AnyView(EmptyView())
    }
}
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}
struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
#Preview {
    MainView()
}
