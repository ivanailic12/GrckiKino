//
//  GameResultsView.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

struct GameResultsView: View {
    @State private var gameDrawData: GameResponse = GameResponse(content: [GameContent(gameId: 1, drawId: 1, drawTime: 1, status: "", drawBreak: 1, visualDraw: 1, winningNumbers: WinningNumbers(list: [], bonus: []))])
    
    var body: some View {
        VStack(alignment: .leading) {
            
            List(gameDrawData.content, id: \.gameId) { gameDraw in
                SingleResultView(gameContent: gameDraw)
            }
            .listStyle(.plain)
            .onAppear() {
                Service().loadGameDrawData { gameDrawData in
                    self.gameDrawData = gameDrawData!
                }
            }
        }
        .padding()
    }
    
}
