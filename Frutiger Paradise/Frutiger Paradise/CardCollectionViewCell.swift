//
//  CardCollectionViewCell.swift
//  Frutiger Paradise
//
//  Created by Anton Kruglov on 06.10.2026.
//

import Foundation
import UIKit

class CardCollectionViewCell: UICollectionViewCell {
    
    private lazy var cardView: UIView = {
        let cardView = UIView()
        
        
        // as is
        return cardView
    }()
    
    
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        //later methods
    }
    
    
    func setupContentView() {
        contentView.backgroundColor = .white
    }
    
     func addSubviews() {
         contentView.addSubview(cardView)
    }
    
    
    
    func setupConstraints() {
        NSLayoutConstraint.activate([
            
            
            
            
          //constrst
            
            
            
            
            
            
        ])
    }
    
    
    
}
