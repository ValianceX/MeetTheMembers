//
//  StatisticsViewController.swift
//  Meet the Members
//
//  Created by Sydney Karimi on 9/13/20.
//  Copyright © 2020 Sydney Karimi. All rights reserved.
//

import UIKit

class StatisticsViewController: UIViewController {
    @IBOutlet weak var streakLabel: UILabel!
    @IBOutlet weak var backToGameButton: UIButton!
    @IBOutlet weak var lastThreeNamesLabel: UILabel!
    
    var lastThreeNamesArray: [String] = []
    var longestStreak: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        streakLabel.text = String(longestStreak)
        lastThreeNamesLabel.text = lastThreeNamesArray[0] + "\n" + lastThreeNamesArray[1] + "\n" + lastThreeNamesArray[2]
        // Do any additional setup after loading the view.
    }

    
    @IBAction func onReturnToGameButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
}
