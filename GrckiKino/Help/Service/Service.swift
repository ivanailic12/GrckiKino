//
//  Service.swift
//  GrckiKino
//
//  Created by Ivana on 8.4.24..
//

import Foundation

class Service : ObservableObject{
    @Published var drawData = [DrawData]()
    
    func loadDrawData(completion:@escaping ([DrawData]) -> ()) {
        guard let url = URL(string: Endpoint.GameDraw.upcoming(gameId: 1100, number: 20)) else {
            print("Invalid url...")
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            let drawData = try! JSONDecoder().decode([DrawData].self, from: data!)
            DispatchQueue.main.async {
                completion(drawData)
            }
        }.resume()
        
    }
    
    func loadGameDrawData(completion: @escaping (GameResponse?) -> Void) {
        guard let url = URL(string: Endpoint.GameDraw.results(gameId: 1100, fromDate: "2024-04-10", toDate: "2024-04-10")) else {
            print("Invalid URL")
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error fetching data: \(error.localizedDescription)")
                completion(nil)
                return
            }
            
            guard let data = data else {
                print("No data received")
                completion(nil)
                return
            }
            
            do {
                let gameResponse = try JSONDecoder().decode(GameResponse.self, from: data)
                DispatchQueue.main.async {
                    completion(gameResponse)
                }
            } catch {
                print("Error decoding data: \(error.localizedDescription)")
                completion(nil)
            }
        }.resume()
    }

}
