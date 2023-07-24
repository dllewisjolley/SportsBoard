//
//  SportController.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

class SportController {
    
    let baseURL = URL(string: "https://api.the-odds-api.com")!
    let apiKey = "7c476db6d32c0d9916731650834495b8"
    
    
    
    var gameCards: [GameCard] = []
    
    func fetchGameCards(completion: @escaping (Error?) -> Void) {
        
        let baseURL = URL(string: "https://api.the-odds-api.com/v4/sports/?apiKey=7c476db6d32c0d9916731650834495b8")!
        
        let bookmakersURL = URL(string: "https://api.the-odds-api.com/v4/sports/upcoming/odds/?regions=us&markets=h2h&oddsFormat=american&apiKey=7c476db6d32c0d9916731650834495b8")!
        
        var urlRequest = URLRequest(url: bookmakersURL)
        urlRequest.httpMethod = HTTPMethod.get.rawValue
        
        
        let dataTask = URLSession.shared.dataTask(with: urlRequest) {[weak self] data, _, error in
            
            if let error = error {
                
                print("error fetching data: \(error)")
                
                completion(NSError())
                
                return
            }
            
            guard let self = self else {
                
                completion(NSError())
                
                return
            }
            
            guard let data = data else {
                
                print("No Data returned from the data Task")
                
                completion(NSError())
                
                return
            }
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                
                let decodedCards = try jsonDecoder.decode([GameCard].self, from: data)
                print(data)
                
                self.gameCards = decodedCards
                
                completion(nil)
                
            } catch {
                
                completion(error)
            }
        }
        
        dataTask.resume()
        
    }
    
    
}
