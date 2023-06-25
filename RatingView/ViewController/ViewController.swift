//
//  ViewController.swift
//  RatingView
//
//  Created by Muhamad Talebi on 6/25/23.
//

import UIKit

class ViewController: UIViewController {

    private lazy var mainView = MainView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(mainView)
        
        mainView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }
}

