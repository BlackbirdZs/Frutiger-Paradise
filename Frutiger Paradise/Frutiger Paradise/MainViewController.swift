//
//  MainViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 02.10.2026.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    var cells = [CardCollectionViewCell()]

    private lazy var cardCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        
        let cardCollection = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayout
        )
        cardCollection.backgroundColor = .black
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
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
            
        //collection to be added
            
    
        ])
    }
}

extension MainViewController: UICollectionViewDelegate {}
extension MainViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cells.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
}

