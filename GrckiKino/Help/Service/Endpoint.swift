//
//  Endpoint.swift
//  GrckiKino
//
//  Created by Ivana on 8.4.24..
//

import Foundation

public struct Endpoint {
    private static var base = "https://api.opap.gr/draws/v3.0"
    
    public static var webViewUrl = "https://www.mozzartbet.com/sr/lotto-animation/26#/"
    
    public struct GameDraw {
        
        public static func upcoming(gameId: Int, number: Int) -> String {
            return base + "/\(gameId)/upcoming/\(number)"
        }
        
        // dateFormat: yyyy-mm-dd
        public static func results(gameId: Int, fromDate: String, toDate: String) -> String {
            return base + "/\(gameId)/draw-date/\(fromDate)/\(toDate)"
        }
        
    }
}
