//
//  NetworkService.swift
//  Sports
//
//  Created by Esraa Khaled   on 30/04/2022.
//  Copyright © 2022 iti. All rights reserved.
//
//https://www.thesportsdb.com/api/v1/json/2/search_all_leagues.php?c=England&s=Soccer
import Foundation
import Alamofire
protocol NetworkProtocol{
    static func getAllLeagues(sportName : String,sportCountry:String, completion : @escaping ([city]?, Error?)->())
}
class NetworkService: NetworkProtocol {
    // MARK: - All Leagues
    var allLeagues = [city]()
    static func getAllLeagues(sportName:String = "Soccer",sportCountry:String = "England", completion : @escaping ([city]?, Error?)->()){
       let parameters: Parameters = [
            "s": sportName,
            "c":sportCountry
            ]
       // AF.request(URLS.url,parameters: parameters,encoding: JSONEncoding(options: [])
        AF.request(URLS.url,method: .post,parameters: parameters,encoding: URLEncoding.queryString)
                  .validate().responseDecodable(of: apiCallData.self) { (response) in
                switch response.result {
                case .success( _):
                    guard let leagues = response.value?.countrys else {
                        print("error")
                        return }
                    print(leagues[0].strSport)
                    print(leagues[0].strCountry)
                    print(leagues[1].strYoutube)
                    print("gggggg")
                    completion(leagues,nil)
        
                case .failure(let error):
                    print(error.localizedDescription)

                    completion(nil , error)
               
                }
            }
    }
    

}
