//
//  SearchViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 17/10/2022.
//

import UIKit

class SearchViewController: UIViewController {
    
  
    var teamsArray: [teamSearch] = []
  
    
    
    private let DiscoverTable: UITableView = {
        let table = UITableView()
        table.register(SearchTableViewCell.self, forCellReuseIdentifier: SearchTableViewCell.identifier)
        return table
        
    }()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: SearchResultViewController())
        controller.searchBar.placeholder = "Search for Player or Team"
        controller.searchBar.searchBarStyle = .minimal
      controller.definesPresentationContext = true
        return controller
        
    }()
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(DiscoverTable)
        DiscoverTable.delegate = self
        DiscoverTable.dataSource = self
        view.backgroundColor = .systemBackground
            // searchController.searchBar.delegate = self
        navigationItem.searchController = searchController
        searchController.searchResultsUpdater = self
        
        APICaller.shared.getTeamSearch {[weak self] result in
            switch result {
            case.success(let teamsArrary):
                DispatchQueue.main.async {
                    self?.teamsArray = teamsArrary
                    self?.DiscoverTable.reloadData()
                    self?.DiscoverTable.separatorStyle  = .none
                }
                
            case.failure(let error):
                print(error.localizedDescription)
                
            }
        }
        
        


    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        DiscoverTable.frame = view.bounds
        
    }
    

   

}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        teamsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SearchTableViewCell.identifier, for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        let search = teamsArray[indexPath.row]
        let model = SearchModel(strTeam: search.strTeam, strTeamBadge: search.strTeamBadge)
      
        cell.configure(with: model)
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let search = teamsArray[indexPath.row]
        let vc = SearchDetailViewController()
        vc.configure(with: searchResultDetailModel(strTeam: search.strTeam, strTeamBadge: search.strTeamBadge, strDescriptionEN: search.strDescriptionEN))
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}

extension SearchViewController: UISearchResultsUpdating, SearchResultViewControllerDelegate{
    func searchResultsViewControllerDidTapItem(_ model:QueryModel) {
        
       
       let vc = SearcchResultDetailViewController()
        vc.configure(with: model)
    
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchBar = searchController.searchBar

        guard let query = searchBar.text,
              !query.trimmingCharacters(in: .whitespaces).isEmpty,
              query.trimmingCharacters(in: .whitespaces).count >= 3,
              let resultController = searchController.searchResultsController as? SearchResultViewController
        else {
            return
        }
        
        resultController.delegate = self
        APICaller.shared.getSearch(with: query) { result in
            DispatchQueue.main.async {
                switch result {
                case.success(let searches):
                    resultController.searches = searches
                   // print(searches)
                    resultController.searchResultCollectionView.reloadData()
                case.failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
        
        
    }
    




}

