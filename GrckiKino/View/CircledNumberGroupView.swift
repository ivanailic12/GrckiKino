//
//  CircledNumberGroupView.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

struct CircledNumberGroupView: View {
    @Binding private var selectedNumbers: [Int]?
    let numbers: [Int]
    let gridItems = [GridItem(.adaptive(minimum: 40))]
    let isSelectionEnabled: Bool

    init(selectedNumbers: Binding<[Int]?>, numbers: [Int], isSelectionEnabled: Bool = true) {
        self._selectedNumbers = selectedNumbers
        self.numbers = numbers
        self.isSelectionEnabled = isSelectionEnabled
    }

    var body: some View {
        LazyVGrid(columns: gridItems, spacing: 8) {
            ForEach(numbers, id: \.self) { number in
                CircledNumberView(number: number, isSelected: Binding(
                    get: { selectedNumbers?.contains(number) ?? false },
                    set: { isSelected in
                        if isSelectionEnabled {
                            if var numbers = selectedNumbers {
                                if isSelected {
                                    numbers.append(number)
                                } else {
                                    numbers.removeAll { $0 == number }
                                }
                                selectedNumbers = numbers
                            }
                        }
                    }
                ), onTapAction: {})
                .disabled(!isSelectionEnabled)
            }
        }
    }
}
