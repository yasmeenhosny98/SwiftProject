//
//  Leagues.swift
//  Sports
//
//  Created by Esraa Khaled   on 30/04/2022.
//  Copyright © 2022 iti. All rights reserved.
//

import Foundation
// MARK: - Welcome

struct  apiCallData: Codable{
    let countrys:[city]?
}
// MARK: - League
struct city: Codable {
    let idLeague:String?
    let strLeague, strBadge: String?
    let strYoutube: String?
    let strSport:String?
    let strCountry:String?
}
