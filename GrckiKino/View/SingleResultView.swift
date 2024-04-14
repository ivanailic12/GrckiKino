//
//  SingleResultView.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

struct SingleResultView: View {
    
    var gameContent: GameContent
    let gridItems = [GridItem(.adaptive(minimum: 40))]
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("\(Localizable.drawing_time): \(gameContent.formattedDrawTime)")
                    .font(.body)
                Divider()
                Text("\(Localizable.draw_cycle): \(gameContent.drawId)")
                    .font(.body)
            }
            
            CircledNumberGroupView(selectedNumbers: .constant(nil), numbers: gameContent.winningNumbers.list)
        }
        .padding([.bottom], 20)
    }
}


struct CircleNumberView: View {
    let number: Int
    
    var body: some View {
        Text("\(number)")
            .font(.body)
            .padding(8)
            .background(Circle().stroke(Color.black, lineWidth: 1))
            .foregroundColor(.black)
    }
}

struct SingleResultView_Previews: PreviewProvider {
    static var previews: some View {
        let gameContent = GameContent(gameId: 1, drawId: 123, drawTime: 1234567890, status: "results", drawBreak: 0, visualDraw: 123,  winningNumbers: WinningNumbers(list: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10], bonus: []))

        return SingleResultView(gameContent: gameContent)
    }
}
