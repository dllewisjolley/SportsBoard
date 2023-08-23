//
//  GameCardCollectionViewController.swift
//  SportsBoard
//
//  Created by Diante Lewis-Jolley on 7/23/23.
//

import UIKit



class GameCardCollectionViewController: UICollectionViewController {
    
    let sportsController = SportController()

    override func viewDidLoad() {
        super.viewDidLoad()

       

        sportsController.fetchGameCards { error in
            if let error = error {
                print(error)
                return
            }
            for game in self.sportsController.gameCards {
                if game.sportTitle.contains("MLB"){
                    print("\(game.awayTeam) is playing \(game.homeTeam)" )
                }
            }
          //  print("\(self.sportsController.gameCards) are all here.")
            
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        collectionView.reloadData()
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
        
        if segue.identifier == "toGameCardDetail" {
            guard let gameCardDetailVC = segue.destination as? GameCardDetailViewController,
                  let indexPath = collectionView.indexPathsForSelectedItems?.first else { return }
            
            let gameCard = sportsController.gameCards[indexPath.item]
            
            gameCardDetailVC.gameCard = gameCard
            
            gameCardDetailVC.sportController = sportsController
        }
        
    }
    

    // MARK: UICollectionViewDataSource

   


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return sportsController.gameCards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gamecardCell", for: indexPath) as? GameCardCollectionViewCell else { return UICollectionViewCell() }
        
        let gameCard = sportsController.gameCards[indexPath.item]
        
        
        
        cell.gameGard = gameCard
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
