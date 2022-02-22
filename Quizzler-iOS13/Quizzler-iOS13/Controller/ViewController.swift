//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var questionBrain = QuestionBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        // Do any additional setup after loading the view.
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswerString = sender.currentTitle!
        
        var userAnswer = false
        if userAnswerString.caseInsensitiveCompare("true") == .orderedSame {
            userAnswer = true
        }
        
        let checkedAnswer = questionBrain.checkAnswer(userAnswer: userAnswer)
        if checkedAnswer {
            sender.backgroundColor = UIColor.green
        }
        else{
            sender.backgroundColor = UIColor.red
        }
        
        questionBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
        
    @objc func updateUI() {
        
        questionLabel.text = questionBrain.getQuestionText()
        progressBar.progress = questionBrain.getProgress()
        scoreLabel.text = String (questionBrain.getScore())
        
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        
    }
    
}

