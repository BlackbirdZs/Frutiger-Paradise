//
//  MainViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 02.10.2026.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    fileprivate let cards = ParadiseCard.make()

    private lazy var cardCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        viewLayout.scrollDirection = .horizontal

        let cardCollection = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        cardCollection.backgroundColor = .black
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
        cardCollection.isScrollEnabled = true
        cardCollection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "card")
        return cardCollection
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Archive of a promised future"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 18, weight: .semibold, width: .expanded)
        return titleLabel
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        addSubviews()
        setupCollectionView()
        setupConstraints()
    }

    func addSubviews() {
        view.addSubview(titleLabel)
        view.addSubview(cardCollection)
    }

    func setupCollectionView() {
        cardCollection.delegate = self
        cardCollection.dataSource = self
    }

    func setupView() {
        view.backgroundColor = .systemGray
    }

    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),

            cardCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            cardCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardCollection.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -20),
        ])
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    
    enum SpacingConstants {
        static let spacing: CGFloat = 8.0
        
    }
 
    internal func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {UIEdgeInsets(top: 40.0, left: SpacingConstants.spacing, bottom: 40.0, right: SpacingConstants.spacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20.0
    }
}

extension MainViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cards.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "card", for: indexPath) as? CardCollectionViewCell else {
            fatalError("could not dequeueReusableCell")
        }
        cell.configure(with: cards[indexPath.item])
        return cell
    }
}
