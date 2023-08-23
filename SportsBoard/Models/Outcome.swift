//
//  Outcome.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

struct Outcome: Codable, Equatable {
    
    let name: String
    let odds: Int
    
    enum CodingKeys: String, CodingKey {
        
        case odds = "price"
        case name
    }
}
