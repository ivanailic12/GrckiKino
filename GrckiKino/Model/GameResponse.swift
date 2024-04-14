//
//  GameResponse.swift
//  GrckiKino
//
//  Created by Ivana on 11.4.24..
//

import SwiftUI

struct GameResponse: Codable {
    let content: [GameContent]
}

struct GameContent: Codable, Hashable {
    let gameId: Int
    let drawId: Int
    let drawTime: TimeInterval
    let status: String
    let drawBreak: Int
    let visualDraw: Int
    let winningNumbers: WinningNumbers
    
    var formattedDrawTime: String {
        return Helper.formatTime(timestamp: drawTime / 1000, format: Helper.TimeFormat.hourMinute)
    }
    
    static func == (lhs: GameContent, rhs: GameContent) -> Bool {
        return lhs.gameId == rhs.gameId &&
            lhs.drawId == rhs.drawId &&
            lhs.drawTime == rhs.drawTime &&
            lhs.status == rhs.status &&
            lhs.drawBreak == rhs.drawBreak &&
            lhs.visualDraw == rhs.visualDraw &&
            lhs.winningNumbers == rhs.winningNumbers
    }

    func hash(into hasher: inout Hasher) {
        hasher.combine(gameId)
        hasher.combine(drawId)
        hasher.combine(drawTime)
        hasher.combine(status)
        hasher.combine(drawBreak)
        hasher.combine(visualDraw)
        hasher.combine(winningNumbers)
    }
}

struct WinningNumbers: Codable, Hashable {
    let list: [Int]
    let bonus: [Int]
}

