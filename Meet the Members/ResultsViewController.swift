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

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        finalScoreLabel.text = "\(finalScore) (\(finalScore)/\(totalQuestions))"
        longestStreakLabel.text = String(longestStreak)
    }

    @IBAction func onPlayAgainButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
