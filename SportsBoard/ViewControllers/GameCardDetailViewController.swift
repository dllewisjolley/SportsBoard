//
//  GameCardDetailViewController.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/24/23.
//

import UIKit

class GameCardDetailViewController: UIViewController {
    
    var gameCard: GameCard?
    
    var sportController: SportController?
    
    
    @IBOutlet weak var homeTeamLabel: UILabel!
    
    @IBOutlet weak var awayTeamLabel: UILabel!
    
    
    
    
    @IBOutlet weak var hTBovadaOddsLabel: UILabel!
    
    
    @IBOutlet weak var aTBovadaOddsLabel: UILabel!
    
    
    @IBOutlet weak var homeTeamImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateViews()
    }
    
    
    private func updateViews() {
        
        guard let gameCard = gameCard else { return }
        
        homeTeamLabel.text = gameCard.homeTeam
        
        awayTeamLabel.text = gameCard.awayTeam
        
        for bookmaker in gameCard.bookmakers {
            if bookmaker.title == "Bovada" {
                
                self.hTBovadaOddsLabel.text = "\(bookmaker.markets[0].outcomes[1].odds)"
                
                self.aTBovadaOddsLabel.text = "\(bookmaker.markets[0].outcomes[0].odds)"
            }
            
           
        }
        
        
        
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
