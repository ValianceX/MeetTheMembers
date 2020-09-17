//
//  ViewController.swift
//  Meet the Members
//
//  Created by Sydney Karimi on 9/12/20.
//  Copyright © 2020 Sydney Karimi. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var gameTitleTest: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    
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
        let backgroundColorArray = [mdbDarkBlueColor.cgColor, mdbLightBlueColor.cgColor, UIColor.white.cgColor]
        gameTitleTest.alpha = 0.0
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let gradientLayer = createDiagonalGradientLayer()
        gradientLayer.colors = backgroundColorArray
        self.view.layer.insertSublayer(gradientLayer, at: 0)
        
        startButton.backgroundColor = mdbYellowColor
        startButton.layer.cornerRadius = 20
        
        logoImageView.image = UIImage(named: "mdb_white.png")
        
        UIView.animate(withDuration: 1.5, animations: {
            self.gameTitleTest.alpha = 1
        })
                
    }
    
    @IBAction func onStartButton(_ sender: Any) {
        performSegue(withIdentifier: "gameStartSegue", sender: self)
    }

    

}

