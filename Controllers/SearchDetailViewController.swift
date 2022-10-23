//
//  SearchDetailViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 23/10/2022.
//

import UIKit

class SearchDetailViewController: UIViewController {
    
   
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight:.bold)
        label.textColor = .systemRed
        return label
        
    }()
    
    private let DescriptionLabel: UILabel = {
        let label = UILabel()
      
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.lineBreakMode = .byWordWrapping
    
        label.numberOfLines = 0
        return label
        
    }()
    
    private let heroImageView: UIImageView = {
           let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
      
           imageView.clipsToBounds = true
        
        
           return imageView
           
       }()
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(heroImageView)
        view.addSubview(titleLabel)
        view.addSubview(DescriptionLabel)
      
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        heroImageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        DescriptionLabel.frame = CGRect(x: 20, y: heroImageView.bottom, width: view.width-50, height: 150)
        titleLabel.frame = CGRect(x: 20, y: DescriptionLabel.bottom-50, width: view.width, height: 150)
      

        
    }
    
   
    
    
   
    
   
    
    func configure(with model: searchResultDetailModel) {
        DescriptionLabel.text = model.strDescriptionEN
        heroImageView.sd_setImage(with: model.strTeamBadge.asUrl)
        titleLabel.text = model.strTeam
        
       
    }
    
    

    

   

}
