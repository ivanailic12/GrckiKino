//
//  TalonView.swift
//  GrckiKino
//
//  Created by Ivana on 10.4.24..
//

import SwiftUI

struct TalonView: View {
    let drawData: DrawData
    
    let numbersArray = Array(1...80)
    
    let numberOfDraw = Array(1...7)
    let oddsArray = [3.75, 14, 65, 275, 1350, 6500, 25000]
    
    @State private var selectedNumbers: [Int]? = []
    
    @State private var randomNumbers: [Int] = []
    @State private var isRandomButtonTapped = false
    
    @State private var selectedMaxNumber = 8
    
    var isSelectionEnabled: Bool {
        selectedNumbers?.count ?? 0 < selectedMaxNumber
    }
    
    func parseNumber(_ myNumber:Double)->String?{
        let formatter = NumberFormatter()
        
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = 2

        let formattedString = formatter.string(from: NSNumber(value: myNumber))!
        return formattedString
    }
    
    private func generateRandomNumbers() {
        let shuffledNumbers = numbersArray.shuffled()
        randomNumbers = Array(shuffledNumbers.prefix(selectedMaxNumber))
        selectedNumbers = randomNumbers
        isRandomButtonTapped = true
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                VStack(alignment: .leading) {
                    Text("\(Localizable.drawing_time): \(drawData.formattedDrawTime)")
                    Text("\(Localizable.draw_cycle): \(drawData.drawId)")
                }
                Spacer()
            }
            .padding(.horizontal)
            
            Divider()
            
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    Text("B.K.")
                        .frame(width: 50, height: 40)
                    ForEach(numberOfDraw, id: \.self) { number in
                        Text("\(number)")
                            .frame(width: 80, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }
                }
                
                HStack(spacing: 10) {
                    Text(Localizable.odd)
                        .frame(width: 50, height: 40)
                    ForEach(oddsArray, id: \.self) { odd in
                        Text("\(parseNumber(odd) ?? "")")
                            .frame(width: 80, height: 40)
                            .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.gray, lineWidth: 1))
                    }
                }
            }
            .padding()
            
            Divider()
            
            HStack {
                Button(Localizable.random_selection) {
                    generateRandomNumbers()
                }
                    .buttonStyle(.borderedProminent)
                Spacer()
                
                Menu {
                    Button {
                        selectedMaxNumber = 8
                    } label: {
                        Text("8")
                    }
                    Button {
                        selectedMaxNumber = 15
                    } label: {
                        Text("15")
                    }
                } label: {
                    Text("\(Localizable.numbers): \(selectedMaxNumber)")
                     Image(systemName: "arrow.down")
                }
            }
            .padding()
            
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text("\(Localizable.choosen_numbers): \(selectedNumbers?.map(String.init).joined(separator: ", ") ?? "")")
                    Text("\(Localizable.number_of_choosen_numbers): \(selectedNumbers?.count ?? 0)")
                }
                Spacer()
            }
            .padding()
            
            Divider()
            
            ScrollView(.vertical) {
                VStack {
                    CircledNumberGroupView(selectedNumbers: $selectedNumbers, numbers: numbersArray, isSelectionEnabled: isSelectionEnabled)
                }
            }
            .padding(15)
        }
    }
}

#Preview {
    TalonView(drawData: DrawData(gameId: 1100, drawId: 111, drawTime: 262626626182, status: "active", drawBreak: 22, visualDraw: 222))
}

