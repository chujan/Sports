//
//  PlayersResponse.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 19/10/2022.
//

import Foundation

struct PlayersResponse: Codable {
    let data: [Players]
}

struct Players: Codable {
    let playerID: Int
    let teamID: Int?
    let countryID, positionID: Int
    let commonName, displayName, fullname, firstname: String
    let lastname: String
    let nationality: Birthcountry
    let birthdate: String
    let birthcountry: Birthcountry
    let birthplace, height, weight: String?
    let imagePath: String
    
    
    
    enum CodingKeys: String, CodingKey {
        case playerID = "player_id"
        case teamID = "team_id"
        case countryID = "country_id"
        case positionID = "position_id"
        case commonName = "common_name"
        case displayName = "display_name"
        case fullname, firstname, lastname, nationality, birthdate, birthcountry, birthplace, height, weight
        case imagePath = "image_path"
        
    }
}
enum Birthcountry: String, Codable {
    case côteDIvoire = "Côte d'Ivoire"
    case denmark = "Denmark"
}
