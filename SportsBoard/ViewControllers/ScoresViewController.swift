//
//  ScoresViewController.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/26/23.
//

import UIKit

class ScoresViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    
    @IBOutlet weak var sportsTitleSegmentedControl: UISegmentedControl!
    
    
    @IBOutlet weak var scoreCardTableView: UITableView!
    
    
    
    
    
    
    
    let sportsController = SportController()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreCardTableView.reloadData()
        
        scoreCardTableView.dataSource = self
        
        scoreCardTableView.delegate = self

        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        scoreCardTableView.reloadData()
        
        //print(sportsController.scoreCards)
    }
    
    

    
    // MARK: - Navigation

  
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sportsController.scoreCards.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = scoreCardTableView.dequeueReusableCell(withIdentifier: "ScoreCellID", for: indexPath) as? ScoreTableViewCell else { return UITableViewCell() }
        
        let scoreCard = sportsController.scoreCards[indexPath.row]
        
        cell.scoreCard = scoreCard
        
        
    
        // Configure the cell
    
        return cell
    }
    
    
    
    @IBAction func sportsTitleHasBeenSwitched(_ sender: Any) {
        
        var sportType: SportType!
        
        switch sportsTitleSegmentedControl.selectedSegmentIndex {
            
        case 0:
            sportType = .MLB
            
        case 1:
            sportType = .NFL
            
        case 2:
            sportType = .NBA
            
        case 3:
            sportType = .WNBA
            
        case 4:
            sportType = .NCAAF
        default:
            break
        }
        
        sportsController.fetchScoreCards(for: sportType) { error in
            if let error = error {
                print(error)
                return
            }
            
            DispatchQueue.main.async {
                
                self.scoreCardTableView.reloadData()
                
             
            }
            
        }
        
    }
    
    
    

}
