//
//  APICaller.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 18/10/2022.
//

import Foundation

struct Constants {
static let API_KEY = "vQGmp8Cqfo7B4FLfLSndGNl5ci1xRiFF8800Wzeeu2VkjsneDhapHAfH7Asz"
static let baseURL = "https://soccer.sportmonks.com/api/v2.0"
    
}

enum APIError: Error {
case failedTogetData
}
class APICaller {
static let shared = APICaller()
    
    func getLeague(completion: @escaping (Result<LeagueResponse, Error>) -> Void) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(LeagueResponse.self, from: data)
                completion(.success(results))
              
            }
            catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func getTeams(completion: @escaping(Result<TeamResponse, Error>) -> Void) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?s=Soccer&c=Spain") else  {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(TeamResponse.self, from: data)
                completion(.success(results))
               // print(results)
              
            }
            catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func getPlayers(completion: @escaping(Result<PlayersResponse, Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/countries/320/players?api_token=\(Constants.API_KEY)") else {return}
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(PlayersResponse.self, from: data)
                completion(.success(results))
               // print(results)
              
            }
            catch {
                completion(.failure(error))
            }

        }
        task.resume()
    }
    
    func getSearch( with query: String, completion: @escaping(Result<[searchPlayer], Error>) -> Void) {
        guard let query = query.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) else {return}
        guard let url = URL(string: "https://soccer.sportmonks.com/api/v2.0/players/search/James%20Forrest?api_token=vQGmp8Cqfo7B4FLfLSndGNl5ci1xRiFF8800Wzeeu2VkjsneDhapHAfH7Asz&query=\(query)") else {
            return
        }
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let results = try JSONDecoder().decode(SearchResponse.self, from: data)
                completion(.success(results.data))
              //  print(results)
              
            }
            catch {
                completion(.failure(error))
            }

        }
        task.resume()
        
    }
    func getTeamSearch(completion: @escaping(Result<[teamSearch], Error>) -> Void) {
        guard let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l=English%20Premier%20League") else {
            return
        }
            
            let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                do {
                    let results = try JSONDecoder().decode(teamsSearchResponse.self, from: data)
                    completion(.success(results.teams))
                    print(results)
                  
                }
                catch {
                    completion(.failure(error))
                }

            }
            task.resume()
        
    }
}



