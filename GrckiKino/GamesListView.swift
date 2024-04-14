//
//  ContentView.swift
//  GrckiKino
//
//  Created by Ivana on 8.4.24..
//

import SwiftUI

struct GamesListView: View {
    @State private var drawData: [DrawData] = []

    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("\(Localizable.greek_kino) (20/80)")
                Divider()
                HStack {
                    Text(Localizable.drawing_time)
                    Spacer()
                    Text(Localizable.remaining_payment)
                }
                Divider()
                List(drawData, id: \.drawId) { draw in
                    GameRow(drawData: draw)
                }
                .listStyle(.plain)
                .onAppear() {
                    Service().loadDrawData { drawData in
                        self.drawData = drawData
                    }
                }
            }
            .padding()
        }
    }
}

#Preview {
    GamesListView()
}
