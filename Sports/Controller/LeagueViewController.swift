//
//  LeaguesViewController.swift
//  Sports
//
//  Created by Esraa Khaled   on 30/04/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import UIKit
import SDWebImage
import Alamofire
class LeagueViewController: UITableViewController {
    var res :[city] = []
    var strSport : String = "Soccer"
    var countryName : String = "England"
    override func viewDidLoad() {
        super.viewDidLoad()
        NetworkService.getAllLeagues(sportName : strSport,sportCountry: countryName)
         { (res, error)in
            if let comingLeauges:[city] = res{
                self.res = comingLeauges
                print("count is \(self.res.count)")
                print("ssssss")
            }
           // self?.res = result!.leagues
           // print(result!.items[0].title)
            DispatchQueue.main.async {
                self.tableView.reloadData()

            }

        
    }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return res.count
    }

   
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LeaguesCell", for: indexPath) as! LeagueCustomCell
        let league = res[indexPath.row]
        cell.leaugeName.text = league.strLeague
       cell.youtubeBtn.isHidden = true
        cell.youtube = league.strYoutube

        if let imgStr = league.strBadge{
            cell.leagueImage.sd_imageIndicator = SDWebImageActivityIndicator.gray
            cell.leagueImage.sd_setImage(with: URL(string: imgStr), placeholderImage: UIImage(named: "placeholder"))
        }
        

        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63.0
    }
    

}
