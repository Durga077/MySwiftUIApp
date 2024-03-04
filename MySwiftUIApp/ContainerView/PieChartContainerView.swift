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
//        NavigationView {
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
                buttonView()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.blue.opacity(0.15))
//        }
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
struct Item {
var title: String
var isSelected: Bool
}
struct buttonView: View {
//    @State var isSelectedArray:[Bool] = [false, false, false]
//    var titleArray = ["Filler", "Empty", "Remove"]
    @State var isSelectedItem:[Item] = [
        Item(title: "Infi", isSelected: false),
        Item(title: "Cap", isSelected: false),
        Item(title: "Lil", isSelected: false),
    ]
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack() {
                ForEach(0..<isSelectedItem.count, id: \.self) { index in
                    SelectedView(isSelected: $isSelectedItem[index].isSelected, title: isSelectedItem[index].title) {
                        isSelectedItem.remove(at: index)
                    }
                }
            }
        }
    }
}
struct SelectedView: View {
    @Binding var isSelected:Bool
    var title: String
    var onDelete: () -> Void
    var body: some View {
        HStack(alignment: .center, spacing: 5) {
            Text("\(title)")  //
                .font(.largeTitle)
                .fontWeight(.bold)
//                .foregroundColor(Color (isSelected ? .black : .white ))
                .foregroundColor(Color.white )
                .padding(.leading, 55)
            Spacer()
            Button(action: { 
                onDelete()
            }, label: {
                Circle()
                    .fill(Color.white)
                    .frame(width: 55, height: 55)
                    .overlay(
                        Image(systemName: "cross")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 29, height: 25)
                            .rotationEffect(.degrees(45))
                    )
                    .padding(.trailing, 25)
            })
//            .disabled(isSelected ? false : true )
        }
        .frame(width: 320, height: 80)
        .background(Color ( isSelected ? Color(hex: 0xD12442) : Color(hex: 0x4B4FA6)))
        .cornerRadius(50)
        .onTapGesture {
            isSelected.toggle()
        }
    }
}

#Preview {
    buttonView()
//    buttonView()
}
