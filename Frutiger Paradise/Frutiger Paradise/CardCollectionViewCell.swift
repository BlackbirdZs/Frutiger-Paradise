//
//  CardCollectionViewCell.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 06.10.2026.
//

import Foundation
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    private lazy var cardImage: UIImageView = {
        let cardView = UIImageView(frame: .zero)
        cardView.translatesAutoresizingMaskIntoConstraints = false
        return cardView
    }()
    
    private lazy var cardTextLabel: UILabel = {
        let cardTextLabel = UILabel()
        cardTextLabel.translatesAutoresizingMaskIntoConstraints = false
        cardTextLabel.backgroundColor = .clear
        cardTextLabel.text = "Test"
        cardTextLabel.textColor = .white
        cardTextLabel.numberOfLines = .max
        cardTextLabel.font = UIFont.systemFont(ofSize: 10, weight: .medium, width: .expanded)
        return cardTextLabel
    }()

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)

        setupContentView()
        addSubviews()
        setupConstraints()
    }

    func setupContentView() {
        self.backgroundColor = .systemGray
    }

     func addSubviews() {
         contentView.addSubview(cardImage)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cardImage.topAnchor.constraint(equalTo: contentView.topAnchor),
            cardImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            cardImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            cardImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),

            cardTextLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 5),
            cardTextLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            cardTextLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -5),
        ])
    }
}
