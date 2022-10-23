//
//  StaduimViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 22/10/2022.
//

import UIKit

class StaduimViewController: UIViewController {

    var teamsArray: [teamSearch] = []
    
    
    private let searchTable: UITableView = {
        let table = UITableView()
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        return table
        
    }()
    
  
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchTable)
        searchTable.delegate = self
        searchTable.dataSource = self
        view.backgroundColor = .systemBackground
            // searchController.searchBar.delegate = self
       
        
        APICaller.shared.getTeamSearch {[weak self] result in
            switch result {
            case.success(let teamsArrary):
                DispatchQueue.main.async {
                    self?.teamsArray = teamsArrary
                    self?.searchTable.reloadData()
                    self?.searchTable.separatorStyle  = .none
                }

            case.failure(let error):
                print(error.localizedDescription)

            }
        }
        
        


    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchTable.frame = view.bounds
        
    }
    

   

}

extension StaduimViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let search = teamsArray[indexPath.row]
        let model = stadiumModel(strStadium: search.strStadium, strStadiumThumb: search.strStadiumThumb)
      
        cell.configure(with: model)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let teams = teamsArray[indexPath.row]
        let vc = StadiumDetailViewController(teams: teams)
        vc.title = teams.strStadium
        vc.configure(with: StadiumDetailModel(strStadiumDescription: teams.strStadiumDescription, strStadiumThumb: teams.strStadiumThumb))
        vc.navigationItem.largeTitleDisplayMode = .never
        self.navigationController?.pushViewController(vc, animated: true)

    }
   
    
}

