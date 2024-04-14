//
//  GameRow.swift
//  GrckiKino
//
//  Created by Ivana on 8.4.24..
//

import SwiftUI

struct GameRow: View {
    
    let drawData: DrawData
    @State private var countdownTimer: CountdownTimer = CountdownTimer()
    
    @State private var timeRemaining: TimeInterval = 0
    @State private var timer: Timer?

    init(drawData: DrawData) {
        self.drawData = drawData
    }

    var body: some View {
        NavigationLink(destination: GameNavigationView(drawData: drawData)) {
            HStack {
                Text(self.formatTime(timestamp: drawData.drawTime / 1000, format: .hourMinute))
                    .font(.body)

                Spacer(minLength: 16)
                
                Text(self.countdownTimer.timeLeftString)
            }
            .onAppear {
                updateTimeRemaining()
            }
        }
    }

    private func updateTimeRemaining() {
        startTimer()
    }

    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            let timeLeft = Date(timeIntervalSince1970: (drawData.drawTime)/1000)
            self.countdownTimer.updateTime(date: timeLeft)
        }
    }

    enum TimeFormat {
        case hourMinute
        case hourMinuteSecond
    }

    private func formatTime(timestamp: TimeInterval, format: TimeFormat) -> String {
        let date = Date(timeIntervalSince1970: timestamp)
        let dateFormatter = DateFormatter()
        switch format {
        case .hourMinute:
            dateFormatter.dateFormat = "HH:mm"
        case .hourMinuteSecond:
            dateFormatter.dateFormat = "HH:mm:ss"
        }
        return dateFormatter.string(from: date)
    }
}
