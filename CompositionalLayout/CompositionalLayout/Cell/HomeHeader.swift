//
//  HomeHeader.swift
//  CompositionalLayout
//
//  Created by LeeJaeHyeok on 2022/05/27.
//

import UIKit

class HomeHeader: UICollectionReusableView {
    
    // MARK: - Properties
    
    static let identifier = "HomeHeader"
    
    // MARK: - Lifecycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureUI() {
        backgroundColor = .systemGreen
    }
}
