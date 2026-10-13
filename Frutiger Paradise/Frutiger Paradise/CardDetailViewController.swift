//
//  CardDetailViewController.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 13.10.2026.
//

import Foundation
import UIKit

class CardDetailViewController: UIViewController {
    
    private lazy var detailDescription: UILabel = {
        let detailDescription = UILabel()
        detailDescription.translatesAutoresizingMaskIntoConstraints = false
        detailDescription.numberOfLines = 0
        
        return detailDescription
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
        addSubviews()
        setupConstraints()
    }
    
    func setupView() {
        view.backgroundColor = .systemGray
    }
    
    func addSubviews() {
        view.addSubview(detailDescription)
    }
    
    func setupConstraints() {
        let safeAreaGuide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            detailDescription.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5),
            detailDescription.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5),
            detailDescription.topAnchor.constraint(equalTo: safeAreaGuide.topAnchor, constant: 10),
            detailDescription.bottomAnchor.constraint(equalTo: safeAreaGuide.bottomAnchor, constant: -15),
        ])
    }
}

