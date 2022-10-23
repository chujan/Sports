//
//  TeamResponse.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 18/10/2022.
//

import Foundation
struct TeamResponse: Codable{
    var teams: [Team]
}

struct Team: Codable {
    var idTeam = ""
    var strTeam = ""
    var strDescriptionEN = ""
   
    var strLeague = ""
    var strSport = ""
    var strTeamBadge = ""
  
   
    

}



