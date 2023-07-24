//
//  GameCardCollectionViewCell.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import UIKit

class GameCardCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var gameCardTitleLabel: UILabel!
    
    var gameGard: GameCard? {
        didSet {
            updateViews()
        }
    }
    
    private func updateViews() {
        
        guard let gameGard = gameGard else { return }
        
        gameCardTitleLabel.text = gameGard.sportTitle
        
    }
    
    
    
}
