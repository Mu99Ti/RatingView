//
//  MainView.swift
//  RatingView
//
//  Created by Muhamad Talebi on 6/25/23.
//

import UIKit

class MainView: UIView {
    
    // MARK: - Private Properties
    private var ratingStars: [StarControl] = []
    
    private lazy var ratingStarsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.alignment = .trailing
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    // MARK: - Initializing View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addingSubViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc private func rateStarTapped(_ sender: UIControl) {
        for i in 0...ratingStars.count-1 {
            ratingStars[i].setDefault()
            for i in 0...sender.tag {
                ratingStars[i].setSelected()
            }
        }
    }
}

// MARK: - Extensions
extension MainView {
    
    // MARK: - Private Methods
    private func starControlInitializer() -> [StarControl] {
        
        for index in 0...4 {
            lazy var ratingStarControl = StarControl(starControlTag: index)
            ratingStarControl.setSizeConstraints(width: 24, height: 24)
            ratingStarControl.addTarget(self, action: #selector(rateStarTapped), for: .touchUpInside)
            ratingStars.append(ratingStarControl)
        }
        
        return ratingStars
    }
    
    private func addingSubViews() {
        let ratingStars = starControlInitializer()
        
        addSubview(ratingStarsStackView)
        
        ratingStars.forEach { StarControl in
            ratingStarsStackView.addArrangedSubview(StarControl)
        }
    }
    
    private func setConstraints() {
        ratingStarsStackView.alignAllEdgesToSuperview(self)
        
        ratingStarsStackView.setSizeConstraints(width: 136, height: 24)
    }
}
