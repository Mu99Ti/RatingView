//
//  RateControl.swift
//  RatingView
//
//  Created by Muhamad Talebi on 6/25/23.
//

import UIKit

class StarControl: UIControl {
    
    // MARK: - Private Properties
    lazy var starImageView: UIImageView = {
        let image = UIImage(systemName: "star")
        let imageView = UIImageView(image: image)
        return imageView
    }()
    
    // MARK: - Initializing View
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(starControlTag: Int) {
        self.init(frame: .zero)
        
        tag = starControlTag
    }
}

// MARK: - Extensions
extension StarControl {
    
    // MARK: - Private Methods
    private func setupView() {
        addSubview(starImageView)
        starImageView.setSizeConstraints(width: 24, height: 24)
        starImageView.alignAllEdgesToSuperview(self)
    }
    
    // MARK: - Internal Methods
    internal func setDefault() {
        UIView.transition(with: starImageView,
                          duration: 0.1,
                          options: .transitionCrossDissolve,
                          animations: { self.starImageView.image = UIImage(systemName: "star") },
                          completion: nil)
    }
    
    // MARK: - Internal Methods
    internal func setSelected() {
        UIView.transition(with: starImageView,
                          duration: 0.2,
                          options: .transitionCrossDissolve,
                          animations: { self.starImageView.image = UIImage(systemName: "star.fill") },
                          completion: nil)
    }
}
