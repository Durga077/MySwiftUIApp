//
//  PieChartContainerView.swift
//  MySwiftUIApp
//
//  Created by User on 12/02/24.
//

import SwiftUI
enum ButtonType: String, CaseIterable {
    case first, second, third, fourth
    var color: Color {
        switch self {
        case .first:
            return .green
        case .second:
            return .yellow
        case .third:
            return .red
        case .fourth:
            return .accentColor
        }
    }
}
struct PieChartContainerView: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State var totalSelectedCount:Int = 0
    @State private var selectedButton: ButtonType?
    @State private var selectedButton1: ButtonType?
    @State private var selectedButton2: ButtonType?
    var body: some View {
        NavigationView {
            VStack {
                Text("\(totalSelectedCount)")
                HStack {
                    ForEach(ButtonType.allCases, id: \.self) { buttonType in
                        NewButtonView(buttonType: buttonType, isSelected: selectedButton == buttonType) {
                            selectButton(buttonType)
                        }
                    }
                }
                HStack {
                    ForEach(ButtonType.allCases, id: \.self) { buttonType in
                        NewButtonView(buttonType: buttonType, isSelected: selectedButton1 == buttonType) {
                            selectButton1(buttonType)
                        }
                    }
                }
                NewButtonView(buttonType: .first, isSelected: true) { print("test button")}
                HStack {
                    ForEach(ButtonType.allCases, id: \.self) { buttonType in
                        NewButtonView(buttonType: buttonType, isSelected: selectedButton2 == buttonType) {
                            selectButton2(buttonType)
                        }
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.15))
        }
        .topNavBar(navBarTitle: "Pie Chart", backButtonAction: {self.presentationMode.wrappedValue.dismiss()})
    }
    func selectedButtonsCount() {
        var count = 0
        if selectedButton != nil {
            count += 1
        }
        if selectedButton1 != nil {
            count += 1
        }
        if selectedButton2 != nil {
            count += 1
        }
        totalSelectedCount = count
    }
    private func selectButton(_ buttonType: ButtonType) {
        selectedButton = selectedButton == buttonType ? nil : buttonType
        print("1st row \(buttonType.rawValue) button pressed")
        selectedButtonsCount()
    }
    private func selectButton1(_ buttonType: ButtonType) {
        selectedButton1 = selectedButton1 == buttonType ? nil : buttonType
        print("2st row \(buttonType.rawValue) button pressed")
        selectedButtonsCount()
    }
    private func selectButton2(_ buttonType: ButtonType) {
        selectedButton2 = selectedButton2 == buttonType ? nil : buttonType
        print("3rd row \(buttonType.rawValue) button pressed")
        selectedButtonsCount()
    }
}

struct NewButtonView: View {
    let buttonType: ButtonType
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(buttonType.rawValue)
                .foregroundColor(isSelected ? .white : .blue)
                .padding()
                .background(isSelected ? buttonType.color : Color.clear)
                .cornerRadius(8)
                .overlay(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.blue, lineWidth: isSelected ? 0 : 1)
                )
        }
        .padding()
    }
}

#Preview {
    PieChartContainerView()
}
