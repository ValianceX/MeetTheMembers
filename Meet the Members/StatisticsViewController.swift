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
    
    //Color and Image Stuff
    let mdbDarkBlueColor = UIColor.init(red: 15/255, green: 109/255, blue: 253/255, alpha: 1)
    let mdbLightBlueColor = UIColor.init(red: 78/255, green: 177/255, blue: 244/255, alpha: 1)
    let mdbYellowColor = UIColor.init(red: 255/255, green: 219/255, blue: 89/255, alpha: 1)
    let pauseImage = UIImage(named: "pause.png")
    let playImage = UIImage(named: "play-button.png")
    let statsImage = UIImage(named: "statistics.png")
    
    func createDiagonalGradientLayer() -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = view.bounds
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 0.0)
        gradientLayer.endPoint = CGPoint(x: 1.0, y: 1.0)
        return gradientLayer
    }
    
    
    var lastThreeNamesArray: [String] = []
    var longestStreak: Int = 0
    var playing: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundColorArray = [mdbDarkBlueColor.cgColor, mdbLightBlueColor.cgColor, UIColor.white.cgColor]
        let gradientLayer = createDiagonalGradientLayer()
        gradientLayer.colors = backgroundColorArray
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        streakLabel.text = String(longestStreak)
        lastThreeNamesLabel.text = lastThreeNamesArray[0] + "\n" + lastThreeNamesArray[1] + "\n" + lastThreeNamesArray[2]
        backToGameButton.layer.cornerRadius = 20
        backToGameButton.backgroundColor = mdbYellowColor
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
