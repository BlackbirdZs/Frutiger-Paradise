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
        cardCollection.backgroundColor = .clear
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
        cardCollection.register(CardCollectionViewCell.self, forCellWithReuseIdentifier: "card")
        return cardCollection
    }()

    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "Archive of a promised future"
        titleLabel.textColor = .white
        titleLabel.font = UIFont.systemFont(ofSize: 30, weight: .semibold, width: .expanded)
        titleLabel.numberOfLines = .max
        return titleLabel
    }()

    private lazy var belowLabel: UILabel = {
        let belowLabel = UILabel()
        belowLabel.translatesAutoresizingMaskIntoConstraints = false
        belowLabel.text = "Tap a memory to open its story"
        belowLabel.textColor = .white
        belowLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold, width: .expanded)

        return belowLabel
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
        view.addSubview(belowLabel)
    }

    func setupCollectionView() {
        cardCollection.delegate = self
        cardCollection.dataSource = self
    }

    func setupView() {
        view.backgroundColor = .black
    }

    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide

        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 35),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),

            cardCollection.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            cardCollection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            cardCollection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            cardCollection.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -220),

            belowLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            belowLabel.topAnchor.constraint(equalTo: cardCollection.bottomAnchor, constant: 35),
        ])
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let itemHeight = collectionView.bounds.height * 0.9
        let itemWidth = collectionView.bounds.width - 170

        return CGSize(width: itemWidth, height: itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
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
