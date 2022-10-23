//
//  PlayersCollectionViewCell.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 19/10/2022.
//

import UIKit

class PlayersCollectionViewCell: UICollectionViewCell {
    static let identifier = "PlayersCollectionViewCell"
    
    private let playersImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
        
    }()
    
    private let playersLabel: UILabel = {
           let label = UILabel()
           label.numberOfLines = 0
           label.font = .systemFont(ofSize: 15, weight: .thin)
           return label
       }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .secondarySystemBackground
        contentView.addSubview(playersImageView)
        contentView.addSubview(playersLabel)
    }
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        playersImageView.frame = contentView.bounds
        playersLabel.frame = CGRect(x: 3, y: contentView.height-30, width: contentView.width-6, height: 30)
    }
    
    func configure(with model: PlayersModel) {
        playersImageView.sd_setImage(with: model.imagePath.asUrl)
        playersLabel.text = model.commonName
    }
    
}
