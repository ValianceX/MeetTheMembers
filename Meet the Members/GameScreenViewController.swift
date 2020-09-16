//
//  GameScreenViewController.swift
//  Meet the Members
//
//  Created by Sydney Karimi on 9/13/20.
//  Copyright © 2020 Sydney Karimi. All rights reserved.
//

import UIKit

class GameScreenViewController: UIViewController {
    //Outlet variables from storyboard
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var pictureView: UIImageView!
    @IBOutlet weak var optionButton1: UIButton!
    @IBOutlet weak var optionButton2: UIButton!
    @IBOutlet weak var optionButton3: UIButton!
    @IBOutlet weak var optionButton4: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var statisticsButton: UIButton!
    
    //Timer stuff
    var time = 5 //5 seconds

    
    //user defined variables
    let nameList = Constants.names //names in the original order
    var gameNameList: [String] = []//the name list we will use for the game
    var totalNames: Int!
    var score = 0 //current score for the game
    var currentlyDisplaying: String!
    var streak: Int = 0
    var results: [String] = []
    var questionNumber = 0
    var lastThreeNames: [String] = ["None", "None", "None"]
    var longestStreak = 0
    
    
    func shuffleNames() -> [String] {
        return nameList.shuffled()
    }

    func setScoreLabel(_ score: Int) {
        scoreLabel.text = ("Score: " + String(score))
    }
    
    func setButtonOptions(_ answer: String) {
        var shuffledOptions = shuffleNames()
        shuffledOptions.removeAll(where: { $0 == answer })
        var buttonTitles: [String] = [answer, shuffledOptions[0], shuffledOptions[1], shuffledOptions[2]]
        buttonTitles.shuffle()
        
        optionButton1.setTitle(buttonTitles[0], for: .normal)
        optionButton2.setTitle(buttonTitles[1], for: .normal)
        optionButton3.setTitle(buttonTitles[2], for: .normal)
        optionButton4.setTitle(buttonTitles[3], for: .normal)
        
    }
    
    func setLastThreeNames(newName:String) {
        lastThreeNames = [newName, lastThreeNames[0], lastThreeNames[1]]
    }
    
    func checkButtonAnswer(answerChoice: String) {
        if answerChoice == currentlyDisplaying {
            score += 1
            streak += 1
            if streak > longestStreak {longestStreak = streak}
            setScoreLabel(score)
        } else {
            if streak > longestStreak {longestStreak = streak}
            streak = 0
        }
    }
    
    func nextQuestion(question: Int) {
        time = 5
        currentlyDisplaying = gameNameList[question]
        //print stuff for debugging
        print("Question: " + String(questionNumber))
        print(currentlyDisplaying)
        print("Longset streak: " + String(longestStreak))
        print("Current streak: " + String(streak))
        
        pictureView.image = Constants.getImageFor(name: currentlyDisplaying)
        setButtonOptions(currentlyDisplaying)
        setScoreLabel(score)
        setLastThreeNames(newName: currentlyDisplaying)
        
        //STILL NEED TO HANDLE THE GAME ENDING HERE!!!!!
    }
    
    func startTimer() {
        time = 5
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    func startGame() {
        gameNameList = shuffleNames()
        lastThreeNames = ["None", "None", "None"]
        longestStreak = 0
        nextQuestion(question: 0)
        startTimer()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        startGame()
    }
    
    @objc func updateTime(){
        if time >= 0 {
            timerLabel.text = String(time)
            time -= 1
        }
        if time == -1 {
            checkButtonAnswer(answerChoice: "No Answer Given")
            questionNumber += 1
            nextQuestion(question: questionNumber)
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStatisticsScreen" {
            let controller = segue.destination as! StatisticsViewController
            controller.lastThreeNamesArray = lastThreeNames
            controller.longestStreak = longestStreak
        }
    }
    
    @IBAction func onStatButton(_ sender: Any) {
        performSegue(withIdentifier: "toStatisticsScreen", sender: self)
    }
    
    @IBAction func onButton1(_ sender: Any) {
        checkButtonAnswer(answerChoice: optionButton1.title(for: .normal) ?? "No Name")
        questionNumber += 1
        nextQuestion(question: questionNumber)
    }
    
    @IBAction func onButton2(_ sender: Any) {
        checkButtonAnswer(answerChoice: optionButton2.title(for: .normal) ?? "No Name")
        questionNumber += 1
        nextQuestion(question: questionNumber)
    }
    
    @IBAction func onButton3(_ sender: Any) {
        checkButtonAnswer(answerChoice: optionButton3.title(for: .normal) ?? "No Name")
        questionNumber += 1
        nextQuestion(question: questionNumber)
    }
    
    @IBAction func onButton4(_ sender: Any) {
        checkButtonAnswer(answerChoice: optionButton4.title(for: .normal) ?? "No Name")
        questionNumber += 1
        nextQuestion(question: questionNumber)
    }
    
}
