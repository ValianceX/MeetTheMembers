//
//  ResultsViewController.swift
//  Meet the Members
//
//  Created by Sydney Karimi on 9/16/20.
//  Copyright © 2020 Sydney Karimi. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {
    @IBOutlet weak var finalScoreLabel: UILabel!
    @IBOutlet weak var longestStreakLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    
    var finalScore = 0
    var longestStreak = 0
    var totalQuestions = 0

    let mdbDarkBlueColor = UIColor.init(red: 15/255, green: 109/255, blue: 253/255, alpha: 1)
    let mdbLightBlueColor = UIColor.init(red: 78/255, green: 177/255, blue: 244/255, alpha: 1)
    let mdbYellowColor = UIColor.init(red: 255/255, green: 219/255, blue: 89/255, alpha: 1)
    
    func createDiagonalGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradientLayer
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColorArray = [mdbDarkBlueColor.cgColor, mdbLightBlueColor.cgColor, UIColor.white.cgColor]
        // Do any additional setup after loading the view.
        let gradientLayer = createDiagonalGradientLayer()
        gradientLayer.colors = backgroundColorArray
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        playAgainButton.backgroundColor = mdbYellowColor
        playAgainButton.layer.cornerRadius = 20

        
        finalScoreLabel.text = "\(finalScore) (\(finalScore)/\(totalQuestions))"
        longestStreakLabel.text = String(longestStreak)
    }

    @IBAction func onPlayAgainButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
