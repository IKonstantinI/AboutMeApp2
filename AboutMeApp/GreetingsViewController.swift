//
//  GreetingsViewController.swift
//  AboutMeApp
//
//  Created by Konstantin on 10.04.2025.
//

import UIKit

final class GreetingsViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    @IBOutlet var logOutButton: UIButton!
    
    var welcomeName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(welcomeName ?? "")!"
        logOutButton.tintColor = .white
        
        applyGradient(
            colors: [. white, .blue],
            startPoint: CGPoint(x: 0.5, y: 0),
            endPoint: CGPoint(x: 0.5, y: 1)
        )
    }
    
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}

extension GreetingsViewController {
    func applyGradient(colors: [UIColor], startPoint: CGPoint, endPoint: CGPoint) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
}


