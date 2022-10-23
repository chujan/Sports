//
//  SearchResultViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 20/10/2022.
//

import UIKit

protocol SearchResultViewControllerDelegate: AnyObject {
    func searchResultsViewControllerDidTapItem(_ model: QueryModel)
    
}

class SearchResultViewController: UIViewController {
    public var searches = [searchPlayer]()
  
    public weak var delegate: SearchResultViewControllerDelegate?

    
   
    public let searchResultCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: UIScreen.main.bounds.width / 3 - 10, height: 200)
        layout.minimumInteritemSpacing = 0
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(searchResultCollectionViewCell.self, forCellWithReuseIdentifier: searchResultCollectionViewCell.identifier)
        return collectionView
        
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(searchResultCollectionView)
        searchResultCollectionView.delegate = self
        searchResultCollectionView.dataSource = self
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        searchResultCollectionView.frame = view.bounds
    }
    

}
extension SearchResultViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return searches.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: searchResultCollectionViewCell.identifier, for: indexPath) as? searchResultCollectionViewCell else {
            return UICollectionViewCell()
        }
        let model = searches[indexPath.row]
        let player  = QueryModel(commonName: model.commonName, imagePath: model.imagePath)
       cell.configure(with: player)
        return cell
       
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let title = searches[indexPath.row]
        let vc = HomeViewController()
        self.delegate?.searchResultsViewControllerDidTapItem(QueryModel(commonName: title.commonName, imagePath: title.imagePath))
        vc.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
}
