//
//  StadiumDetailViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 22/10/2022.
//

import UIKit

class StadiumDetailViewController: UIViewController {
    private var teams = teamSearch()

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
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 12, weight: .medium)
       
        return label
        
    }()
    
    private let heroImageView: UIImageView = {
           let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
      
           imageView.clipsToBounds = true
        
        
           return imageView
           
       }()
    init(teams: teamSearch) {
       
        self .teams = teams
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
   
    
    

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
        DescriptionLabel.frame = CGRect(x: 5, y: heroImageView.bottom+20, width: view.width-20, height: 200)
        //titleLabel.frame = CGRect(x: , y: DescriptionLabel.bottom, width: view.width, height: 150)
      

        
    }
    
   
    
    
   
    
   
    
    func configure(with model: StadiumDetailModel) {
       
        DescriptionLabel.text = model.strStadiumDescription
        heroImageView.sd_setImage(with: model.strStadiumThumb.asUrl)
    }
    
    

}
