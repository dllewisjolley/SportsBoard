//
//  Market.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

struct Market: Codable, Equatable {
    
    let key: String
    
    let outcomes: [Outcome]
}
