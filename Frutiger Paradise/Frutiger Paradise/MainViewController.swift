//
//  MainViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 02.10.2026.
//

import Foundation
import UIKit

class MainViewController: UIViewController {
    
    private lazy var cardCollection: UICollectionView = {
        let cardCollection = UICollectionView()
        cardCollection.translatesAutoresizingMaskIntoConstraints = false
        
        
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
        setupConstraints()
    }
    
    func addSubviews() {
        view.addSubview(titleLabel)
    }
    
    func setupView() {
        view.backgroundColor = .systemGray
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            
            cardCollection.
    
        ])
    }
}

extension MainViewController: UICollectionViewDelegate {}
extension MainViewController: UICollectionViewLayout {
    
}
