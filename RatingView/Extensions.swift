//
//  Extensions.swift
//  RatingView
//
//  Created by Muhamad Talebi on 6/25/23.
//

import UIKit

extension UIView {
    
    @discardableResult
    func alignAllEdgesToSuperview(_ parentView: UIView) -> [NSLayoutConstraint] {
        
        let constraints: [NSLayoutConstraint]?
        
        translatesAutoresizingMaskIntoConstraints = false
        
        constraints = [
            topAnchor.constraint(equalTo: parentView.topAnchor),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor)
        ]
        
        guard let constraints else { return [] }
        
        NSLayoutConstraint.activate(constraints)
        
        return constraints
    }
    
    func alignAllEdgesToSuperviewWithPadding(_ parentView: UIView, padding: CGFloat) {
        
        let constraints: [NSLayoutConstraint]
        
        translatesAutoresizingMaskIntoConstraints = false
        
        constraints = [
            topAnchor.constraint(equalTo: parentView.topAnchor, constant: padding),
            trailingAnchor.constraint(equalTo: parentView.trailingAnchor, constant: -(padding)),
            bottomAnchor.constraint(equalTo: parentView.bottomAnchor, constant: -(padding)),
            leadingAnchor.constraint(equalTo: parentView.leadingAnchor, constant: padding)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    func setSizeConstraints(width: CGFloat, height: CGFloat) {
        
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalToConstant: width),
            heightAnchor.constraint(equalToConstant: height)
        ])
    }
}

extension UIStackView {
    static func makeForStackView(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 8, alignment: UIStackView.Alignment = .fill, distribution: UIStackView.Distribution = .fillProportionally) -> UIStackView {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.spacing = spacing
        stackView.alignment = alignment
        stackView.distribution = distribution
        return stackView
    }
}

extension UIStackView {
    func removeAllArrangedSubviews() {
        let removedSubviews = arrangedSubviews.reduce([]) { (allSubviews, subview) -> [UIView] in
            self.removeArrangedSubview(subview)
            return allSubviews + [subview]
        }
        
        // Deactivate all constraints
        NSLayoutConstraint.deactivate(removedSubviews.flatMap({ $0.constraints }))
        
        // Remove the views from self
        removedSubviews.forEach({ $0.removeFromSuperview() })
    }
}

extension UILabel {
    static func makeForLabelView(text: String? = nil, textAlignment: NSTextAlignment = .left, font: UIFont? = UIFont(name: "Arial", size: 10), textColor: UIColor = .black) -> UILabel {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = textAlignment
        label.text = text
        label.font = font
        label.textColor = textColor
        return label
    }
}
