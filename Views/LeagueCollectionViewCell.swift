//
//  LeagueCollectionViewCell.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 19/10/2022.
//

import UIKit
import SDWebImage

class LeagueCollectionViewCell: UICollectionViewCell {
    static let identifier = "LeagueCollectionViewCell"
    
    
    private let leagueImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    private let leagueLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
        label.textColor = .systemBackground
           label.font = .systemFont(ofSize: 15, weight: .thin)
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(leagueImageView)
        contentView.addSubview(leagueLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        leagueImageView.frame = contentView.bounds
        leagueLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
    }
    
    func configure(with model: LeagueaModel) {
        leagueImageView.sd_setImage(with: model.strSportThumb.asUrl)
        leagueLabel.text = model.strSport
    }
    
    
    
}
