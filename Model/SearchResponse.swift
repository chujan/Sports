//
//  SearchResponse.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 20/10/2022.
//

import Foundation

struct SearchResponse: Codable {
    let data: [searchPlayer]
}

struct searchPlayer: Codable {
    let playerID: Int
    let teamID: Int?
   // let countryID, positionID: Int
    let commonName, displayName, fullname, firstname: String
   let lastname: String
  // let nationality: Birthcountry

 //  let birthcountry: Birthcountry
    let  height, weight: String?
    let imagePath: String

    enum CodingKeys: String, CodingKey {
        case playerID = "player_id"
        case teamID = "team_id"
       // case countryID = "country_id"
      // case positionID = "position_id"
        case commonName = "common_name"
       case displayName = "display_name"
       case fullname, firstname, lastname,  height, weight
        case imagePath = "image_path"
    }
    
}



