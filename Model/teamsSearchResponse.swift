//
//  teamsSearchResponse.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 21/10/2022.
//

import Foundation
struct teamsSearchResponse: Codable {
    var teams: [teamSearch]
}

struct teamSearch: Codable {
    var idTeam = ""
    var strTeam = ""
   var strTeamBadge = ""
   var strAlternate = ""
    var strLeague = ""
    var strStadiumThumb = ""
    var strKeywords = ""
   var strYoutube = ""
    var strTeamLogo = ""
    var strStadium = ""
    var strDescriptionEN = ""
    var strStadiumDescription = ""
}
