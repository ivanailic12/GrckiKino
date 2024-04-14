//
//  CircledNumberView.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

struct CircledNumberView: View {
    private let number: Int
    @Binding private var isSelected: Bool
    private let onTapAction: () -> Void

    init(number: Int, isSelected: Binding<Bool>,
         onTapAction: @escaping () -> Void) {
        self.number = number
        self._isSelected = isSelected
        self.onTapAction = onTapAction
    }

    var body: some View {
        ZStack {
          Circle()
                .stroke(Color.blue, lineWidth: 2)
                .background(Circle().foregroundColor(isSelected ? Color.blue : Color.clear))
          
            Text(number.formatted())
        }
        .frame(width: 40, height: 40)
        .onTapGesture {
            isSelected.toggle()
            onTapAction()
        }
    }

}
