//
//  SearcchResultDetailViewController.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 22/10/2022.
//

import UIKit



class SearcchResultDetailViewController: UIViewController {
   // public var searches : searchPlayer
   
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
        label.numberOfLines = 0
        return label
        
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.numberOfLines = 0
        
        return label
        
    }()
    
    private let birthLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 10, weight: .medium)
        label.numberOfLines = 0
        
        return label
        
    }()
    
    private let heroImageView: UIImageView = {
           let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
      
           imageView.clipsToBounds = true
        
        
           return imageView
           
       }()
//    init(searches: searchPlayer) {
//       
//        self.searches = searches
//        super.init(nibName: nil, bundle: nil)
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError()
//    }
   
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(heroImageView)
        view.addSubview(titleLabel)
        view.addSubview(DescriptionLabel)
        view.addSubview(nameLabel)
        view.addSubview(birthLabel)
      
       
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        heroImageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        DescriptionLabel.frame = CGRect(x: 20, y: heroImageView.bottom-80, width: view.width-50, height: 150)
        titleLabel.frame = CGRect(x: 20, y: DescriptionLabel.bottom-80, width: view.width, height: 150)
        nameLabel.frame = CGRect(x: 20, y: titleLabel.bottom-100, width: view.width, height: 150)
        birthLabel.frame = CGRect(x: 20, y: titleLabel.bottom, width: view.width, height: 100)
       
       
      

        
    }
    
   
    
    
   
    
   
    
    func configure(with model: QueryModel) {
        titleLabel.text = model.commonName
      
        heroImageView.sd_setImage(with: model.imagePath.asUrl)
      
       
    }
    
    

   

}
