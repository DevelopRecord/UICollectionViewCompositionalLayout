//
//  HomeController.swift
//  CompositionalLayout
//
//  Created by LeeJaeHyeok on 2022/05/27.
//

import UIKit

class HomeController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        view.backgroundColor = .systemRed
    }
}
