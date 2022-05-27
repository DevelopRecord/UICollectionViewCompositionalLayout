//
//  HomeCell.swift
//  CompositionalLayout
//
//  Created by LeeJaeHyeok on 2022/05/27.
//

import UIKit

class HomeCell: UICollectionViewCell {
    
    // MARK: - Properties
    
    static let identifier = "HomeCell"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        configureConstraints()
        backgroundColor = .systemBlue
        
    }
    
    func configureConstraints() {

    }
}
