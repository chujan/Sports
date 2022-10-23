//
//  SportDetailViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 21/10/2022.
//

import UIKit

class SportDetailViewController: UIViewController {
    private  var league = Datum()
    private var Teams = Team()
    
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
        label.font = .systemFont(ofSize: 12, weight: .medium)
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
    init(league: Datum) {
        self.league = league
       // self.Teams = Teams
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
        DescriptionLabel.frame = CGRect(x: 5, y: heroImageView.bottom, width: view.width-5, height: 200)
        titleLabel.frame = CGRect(x: 5, y: DescriptionLabel.bottom-10, width: view.width, height: 50)
      

        
    }
    
   
    
    
   
    
    func configure(with model: DetailModel) {
        titleLabel.text = model.strFormat
        heroImageView.sd_setImage(with: model.strSportThumb.asUrl)
        DescriptionLabel.text = model.strSportDescription
    }
    
    func configure(with model: teamsDetail) {
        titleLabel.text = model.strTeam
        DescriptionLabel.text = model.strDescriptionEN
        heroImageView.sd_setImage(with: model.strTeamBadge.asUrl)
    }
    

    

}
