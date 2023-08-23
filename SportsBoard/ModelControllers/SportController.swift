//
//  SportController.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

class SportController {
    
    let baseURL = URL(string: "https://api.the-odds-api.com/v4/sports/")!
    let apiKey = "7c476db6d32c0d9916731650834495b8"
    
    var mlbGameCards: [GameCard] {
        return gameCards.filter {($0.sportTitle.contains("MLB"))}
    }
    
    
    
    var gameCards: [GameCard] = []
    
    var scoreCards: [ScoreCard] = []
    
    
    func fetchScoreCards(for sportType: SportType, completion: @escaping (Error?) -> Void) {
        
        //https://api.the-odds-api.com/v4/sports/baseball_mlb/scores/?daysFrom=1&apiKey=7c476db6d32c0d9916731650834495b8
        
        // https://api.the-odds-api.com/v4/sports/baseball_mlb/scores?apiKey=7c476db6d32c0d9916731650834495b8

        
        let sportURL = baseURL.appending(path: sportType.rawValue)
        
        let sportsURL = sportURL.appending(path: "scores")
        
        var urlComponent = URLComponents(url:sportsURL  , resolvingAgainstBaseURL: true)
        
        let apiQuery = URLQueryItem(name: "apiKey", value: apiKey)
        
        let daysFromQuerey = URLQueryItem(name: "daysFrom", value: "1")
        
        urlComponent?.queryItems = [daysFromQuerey, apiQuery]
        
        guard let urlRequest = urlComponent?.url else {
            
            print("Request URL is nil")
            
            completion(NSError())
            
            return
        }
        
        var request = URLRequest(url: urlRequest)
        
        print(request)
        
        
        
        request.httpMethod = HTTPMethod.get.rawValue
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            
            if let error = error {
                
                print("Error fetching Scores Data: \(error)")
                
                completion(NSError())
                
                return
            }
            
            guard let self = self else { return  }
            
            guard let data = data else {
                print("No Data was returned from dataTask")
                completion(NSError())
                return
            }
            
            let jsonDecoder = JSONDecoder()
            
            jsonDecoder.keyDecodingStrategy = .convertFromSnakeCase
            
            do {
                
                let newScoreCards = try jsonDecoder.decode([ScoreCard].self, from: data)
                
                
                self.scoreCards = newScoreCards
                
               completion(nil)
                
            } catch {
                
                completion(error)
            }
            
            
            
            
        }
        
        dataTask.resume()
        
        
    }
    
    func fetchGameCards(completion: @escaping (Error?) -> Void) {
        
      
        
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
               
                self.gameCards = decodedCards
                
                completion(nil)
                
            } catch {
                
                completion(error)
            }
        }
        
        dataTask.resume()
        
    }
    
    
}
