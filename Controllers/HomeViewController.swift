//
//  HomeViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 17/10/2022.
//

import UIKit
import SDWebImage

enum BrowseSectionType {
    case newLeagues(viewModels: [LeagueaModel])
    case newTeams(viewModels: [TeamModel])
    case newPlayers(viewModels: [PlayersModel])
    
    var title:String {
        switch self {
        case .newLeagues:
            return "All Sports"
        case .newTeams:
            return "Teams"
        case .newPlayers:
            return "Players"
        }
    }
}

class HomeViewController: UIViewController {
    
    
    private var collectionView: UICollectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewCompositionalLayout { sectionIndex, _ -> NSCollectionLayoutSection? in
        return HomeViewController.createSectionLayout(section: sectionIndex)
        
    })
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureCollectionView()
        fetchData()
        
      
       
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLoad()
        collectionView.frame = view.bounds
    }
    
    
    private var Leagues: [Datum] = []
    private var Teams: [Team] = []
    private var Players: [Players] = []
    
    private var sections = [BrowseSectionType]()
    
    private func fetchData() {
        let group = DispatchGroup()
        group.enter()
        group.enter()
        group.enter()
        
        var newLeagues: LeagueResponse?
        var newtTeams: TeamResponse?
        var newPlayers: PlayersResponse?
        
        
        APICaller.shared.getLeague { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                newLeagues = model
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        APICaller.shared.getTeams { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                newtTeams  = model
            case.failure(let error):
                print(error.localizedDescription)
            }
            
         
        }
        
        APICaller.shared.getPlayers { result in
            defer {
                group.leave()
            }
            switch result {
            case.success(let model):
                newPlayers = model
            case.failure(let error):
                print(error.localizedDescription)
            }
        }
        
        group.notify(queue: .main) {
            guard let Leagues = newLeagues?.sports,
                  let Teams = newtTeams?.teams,
                  let Players = newPlayers?.data else {
                return
            }
            self.configureModels(League: Leagues, Teams: Teams, Players: Players)
        }
    }
    
    private func configureModels(League: [Datum], Teams:[Team], Players:[Players]) {
        self.Leagues = League
        self.Teams = Teams
        self.Players = Players
        
        sections.append(.newLeagues(viewModels: League.compactMap({ return  LeagueaModel(strSport: $0.strSport, strSportThumb: $0.strSportThumb)
        
        })))
        
        sections.append(.newTeams(viewModels: Teams.compactMap({ return
            TeamModel(strLeague: $0.strLeague, strTeamBadge: $0.strTeamBadge)
        })))
        sections.append(.newPlayers(viewModels: Players.compactMap({ return
            PlayersModel(commonName: $0.commonName, imagePath: $0.imagePath)
        })))
        collectionView.reloadData()
        

    }
    
    
    private func configureCollectionView() {
        view.addSubview(collectionView)
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.identifier)
        collectionView.register(TeamsCollectionViewCell.self, forCellWithReuseIdentifier: TeamsCollectionViewCell.identifier)
        collectionView.register(PlayersCollectionViewCell.self, forCellWithReuseIdentifier: PlayersCollectionViewCell.identifier)
        collectionView.register(TitleHeaderCollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier)
        collectionView.backgroundColor = .systemBackground
         
       
    }
    
    static func createSectionLayout(section: Int) -> NSCollectionLayoutSection {
        let supplementaryViews = [ NSCollectionLayoutBoundarySupplementaryItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(50)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)]
        switch section {
        case 0:
                   
                   let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension:.absolute(140))
                   )
                   item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                   
                   let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: item, count: 1)
                   
                   let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: verticalgroup, count: 1
                           )
                   
                   
                   
                   let section = NSCollectionLayoutSection(group: horizontalgroup)
                   section.orthogonalScrollingBehavior = .continuous
                   section.boundarySupplementaryItems = supplementaryViews
                   return section
            
        case 1:
                   
                   let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension:.absolute(140))
                   )
                   item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                   
                   let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: item, count: 1)
                   
                   let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: verticalgroup, count: 1
                           )
                   
                   
                   
                   let section = NSCollectionLayoutSection(group: horizontalgroup)
                   section.orthogonalScrollingBehavior = .continuous
                   section.boundarySupplementaryItems = supplementaryViews
                   return section
            
        case 2:
                   
                   let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension:.absolute(140))
                   )
                   item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                   
                   let verticalgroup = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: item, count: 1)
                   
                   
                   
                   
                   
                   let horizontalgroup = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(140), heightDimension: .absolute(200)), subitem: verticalgroup, count: 1
                           )
                   
                   
                   
                   let section = NSCollectionLayoutSection(group: horizontalgroup)
                   section.orthogonalScrollingBehavior = .continuous
                   section.boundarySupplementaryItems = supplementaryViews
                   return section
            
        default:
            let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension:.fractionalHeight(1.0))
                       )
                       item.contentInsets = NSDirectionalEdgeInsets(top: 2, leading: 2, bottom: 2, trailing: 2)
                       
                       let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(390)), subitem: item, count: 1)
                     
                       
                       
                       let section = NSCollectionLayoutSection(group: group)
                     //  section.boundarySupplementaryItems = supplementaryViews
                       return section
                       
                   
                   
                   
        }
    }
    
   
       
    }

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let type = sections[section]
        switch type {
        case.newLeagues(let viewModels):
            return viewModels.count
        case.newTeams(let viewModels):
            return viewModels.count
        case.newPlayers(let viewModels):
            return viewModels.count
            
        }
    }
    func numberOfSections(in collectionView: UICollectionView) -> Int {
       return sections.count
    }

    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let type = sections[indexPath.section]
        switch type {
        case.newLeagues(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.identifier, for: indexPath) as? LeagueCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case.newTeams( let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TeamsCollectionViewCell.identifier, for: indexPath) as? TeamsCollectionViewCell else {
                return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
        case.newPlayers(let viewModels):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PlayersCollectionViewCell.identifier, for: indexPath) as? PlayersCollectionViewCell else {
            return UICollectionViewCell()
            }
            let viewModel = viewModels[indexPath.row]
            cell.configure(with: viewModel)
            return cell
            
        }
    
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard  let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: TitleHeaderCollectionReusableView.identifier, for: indexPath) as? TitleHeaderCollectionReusableView, kind == UICollectionView.elementKindSectionHeader else {
            return UICollectionReusableView()
            
        }
        let section = indexPath.section
        let title = sections[section].title
        header.configure(with: title)
        return header
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let section = sections[indexPath.section]
        switch section {
        case.newLeagues:
            let league = Leagues[indexPath.row]
            let vc = SportDetailViewController(league: league)
            vc.title = league.strSport
            vc.configure(with: DetailModel(strSportThumb: league.strSportThumb, strSportDescription: league.strSportDescription, strFormat:league.strFormat))
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
        case .newTeams:
            let Teams = Teams[indexPath.row]
            let vc = TeamsDetailViewController(Teams: Teams)
            vc.title = Teams.strLeague
            vc.configure(with: teamsDetail(strTeam: Teams.strTeam, strDescriptionEN: Teams.strDescriptionEN, strTeamBadge: Teams.strTeamBadge))
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
           
        case .newPlayers:
            let player = Players[indexPath.row]
            let vc = PlayersDetailViewController(player: player)
            vc.title = player.commonName
            vc.configure(with: playersDetailModel(commonName: player.fullname, imagePath: player.imagePath, height: player.height ?? "", nationality: player.birthcountry, birthdate: player.birthdate))
            vc.navigationItem.largeTitleDisplayMode = .never
            navigationController?.pushViewController(vc, animated: true)
          
        }
    }
    
    
    
    
}
    




