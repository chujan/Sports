//
//  TeamsCollectionViewCell.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 19/10/2022.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "TeamsCollectionViewCell"
    
    
    private let teamsImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private let teamsLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
        
           label.font = .systemFont(ofSize: 10, weight: .thin)
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(teamsImageView)
        contentView.addSubview(teamsLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        teamsImageView.frame = contentView.bounds
        teamsLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
    }
    
    func configure(with model: TeamModel) {
        teamsImageView.sd_setImage(with: model.strTeamBadge.asUrl)
        teamsLabel.text = model.strLeague
    }
    
    
    
}
