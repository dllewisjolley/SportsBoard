//
//  BookMaker.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import Foundation

struct Bookmaker: Codable, Equatable {
    
    let title: String
    
    let markets: [Market]
    
}
