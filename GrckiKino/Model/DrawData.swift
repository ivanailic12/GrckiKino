//
//  DrawData.swift
//  GrckiKino
//
//  Created by Ivana on 8.4.24..
//

import SwiftUI

struct DrawData: Codable {
    var gameId: Int
    var drawId: Int
    var drawTime: TimeInterval
    var status: String
    var drawBreak: Int
    var visualDraw: Int

    var formattedDrawTime: String {
        return Helper.formatTime(timestamp: drawTime / 1000, format: Helper.TimeFormat.hourMinute)
    }
    
}
