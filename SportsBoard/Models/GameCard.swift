//
//  GameCard.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

struct GameCard: Codable {
    
    let sportTitle: String
    
    let homeTeam: String
    
    let awayTeam: String
    
    let bookmakers: [Bookmaker]
}
