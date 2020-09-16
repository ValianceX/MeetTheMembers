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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        gameTitleTest.text = "Match\nthe\nMembers!"
    }
    
    @IBAction func onStartButton(_ sender: Any) {
        performSegue(withIdentifier: "gameStartSegue", sender: self)
    }

    

}

