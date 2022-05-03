//
//  ViewController.swift
//  Sports
//
//  Created by yasmeen hosny on 4/26/22.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource{
    
    var teams: [Team] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let team1 = Team()
        team1.name = "Alahly"
        team1.logo = "Alahly"
        
        let team2 = Team()
        team2.name = "Elzamalk"
        team2.logo = "Elzamalk"
        
        
        teams.append(team1)
        teams.append(team2)
        teams.append(team1)
        teams.append(team2)
        teams.append(team1)
        teams.append(team2)
        teams.append(team1)
        teams.append(team2)
    }
}

// dataSource methods
extension ViewController{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.teams.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // get a reference to our storyboard cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! TeamsCollectionViewCell
        
        cell.teamName.text = self.teams[indexPath.row].name
        cell.teamLogu.image = UIImage(named: self.teams[indexPath.row].logo!)
        
        return cell
    }

}

