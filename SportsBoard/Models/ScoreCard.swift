//
//  ScoreCard.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/26/23.
//

import Foundation

struct ScoreCard: Codable {
    
    let sportKey : String
    
    let sportTitle : String
    
    let commenceTime: String
    
    let completed: Bool
    
    let homeTeam : String
    
    let  awayTeam : String
    
   let scores: [Score]?
}
