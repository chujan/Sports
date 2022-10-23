//
//  LeagueResponse.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 18/10/2022.
//

import Foundation

struct LeagueResponse: Codable {
    var sports: [Datum]
   
}

struct Datum:Codable {
    var idSport = ""
    var strSport = ""
    var strSportThumb = ""
    var strSportIconGreen = ""
    var strSportDescription = ""
    var strFormat = ""
   
    
}

