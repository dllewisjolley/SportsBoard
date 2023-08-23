//
//  ScoreTableViewCell.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/26/23.
//

import UIKit

class ScoreTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var hTeamTitleLabel: UILabel!
    
    
    
    @IBOutlet weak var aTeamTitleLabel: UILabel!
    
    
    @IBOutlet weak var hTeamScoreLabel: UILabel!
    
    
    
    @IBOutlet weak var aTeamScoreLabel: UILabel!
    
    var scoreCard: ScoreCard? {
        didSet{
            updateViews()
        }
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func updateViews() {
        
        guard let scoreCard = scoreCard else { return }
        
       if scoreCard.scores != nil {
            
            let homeTeam = scoreCard.scores?[0]
            
            let awayTeam = scoreCard.scores?[1]
            
            hTeamScoreLabel.text = homeTeam?.score
            
            aTeamScoreLabel.text = awayTeam?.score
            
            hTeamTitleLabel.text = scoreCard.homeTeam
            
            aTeamTitleLabel.text = scoreCard.awayTeam
            
        } else {
            
            hTeamTitleLabel.text = scoreCard.homeTeam
            
            aTeamTitleLabel.text = scoreCard.awayTeam
            
            hTeamScoreLabel.text = "N/A"
            
            aTeamScoreLabel.text = "N/A"
            
        }
    }

}
