//
//  GameNavigationView.swift
//  GrckiKino
//
//  Created by Ivana on 10.4.24..
//

import SwiftUI

struct GameNavigationView: View {
    let drawData: DrawData

    var body: some View {
            TabView {
                NavigationView {
                    TalonView(drawData: drawData)
                }
                .tabItem {
                    Label(Localizable.numbers_talon, systemImage: "square.grid.2x2")
                }
                
                NavigationView {
                    Text(Localizable.more_games)
                        .navigationTitle(Localizable.more_games)
                }
                .tabItem {
                    Label(Localizable.more_games, systemImage: "plus.circle")
                }
                
                NavigationView {
                    LiveDrawView()
                }
                .tabItem {
                    Label(Localizable.live_draw, systemImage: "play.circle")
                }
                
                NavigationView {
                    GameResultsView()
                        .navigationTitle(Localizable.draws_results)
                }
                .tabItem {
                    Label(Localizable.draws_results, systemImage: "r.circle")
                }
                
                NavigationView {
                    Text(Localizable.quick_keno)
                        .navigationTitle(Localizable.quick_keno)
                }
                .tabItem {
                    Label(Localizable.quick_keno, systemImage: "z.circle")
                }
            }
        }
}
