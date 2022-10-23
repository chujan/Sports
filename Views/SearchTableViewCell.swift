//
//  SearchTableViewCell.swift
//  Sports
//
//  Created by Jennifer Chukwuemeka on 20/10/2022.
//

import UIKit
import SDWebImage

class SearchTableViewCell: UITableViewCell {

   static let identifier = "SearchTableViewCell"
    
    private let searchUIImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        return imageView
        
    }()
    
    private let searchLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 5
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(searchUIImageView)
        contentView.addSubview(searchLabel)
        applyConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func applyConstraints () {
        let searchUIImageViewConstraints = [
            searchUIImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: +15),
            searchUIImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            searchUIImageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            searchUIImageView.widthAnchor.constraint(equalToConstant: 100)
        ]
        
        let searchLabelContraints = [
            searchLabel.leadingAnchor.constraint(equalTo: searchUIImageView.trailingAnchor, constant: 25),
            searchLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
        ]
        NSLayoutConstraint.activate(searchUIImageViewConstraints)
        NSLayoutConstraint.activate(searchLabelContraints)
    }
    
    func configure(with model: SearchModel) {
        searchLabel.text = model.strTeam
        searchUIImageView.sd_setImage(with: model.strTeamBadge.asUrl)
        
    }
    func configure(with model: stadiumModel) {
        searchLabel.text = model.strStadium
        searchUIImageView.sd_setImage(with: model.strStadiumThumb.asUrl)
    }
}
