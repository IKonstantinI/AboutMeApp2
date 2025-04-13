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
        view.applyGradient(colors: [.blue, .green])
    }
    
    @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}

extension UIView {
    func applyGradient(colors: [UIColor]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 0, y: 1)
        layer.insertSublayer(gradientLayer, at: 0)
    }
}


