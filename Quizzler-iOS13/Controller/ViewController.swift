//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var answerOption1: UIButton!
    @IBOutlet weak var answerOption2: UIButton!
    @IBOutlet weak var answerOption3: UIButton!
    @IBOutlet weak var questionText: UILabel!
    @IBOutlet weak var scoreText: UILabel!
    
    
    var questionLogic = QuestionLogic()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updateView()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        if questionLogic.checkAnswers(userAnswer) {
            sender.backgroundColor = UIColor.systemGreen
        } else {
            sender.backgroundColor = UIColor.systemRed
        }
        
        questionLogic.updateCurrentQuestionNumber()
        updateView()

        
    }
    
    func updateView(){
        
        let seconds = 0.1
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { [self] in
            self.progressBar.progress = self.getPercentage(CurrentQuestion: questionLogic.currentQuestion)
            self.questionText.text = questionLogic.questions[questionLogic.currentQuestion].q
            self.answerOption1.setTitle(questionLogic.questions[questionLogic.currentQuestion].a[0], for: .normal)
            self.answerOption2.setTitle(questionLogic.questions[questionLogic.currentQuestion].a[1], for: .normal)
            self.answerOption3.setTitle(questionLogic.questions[questionLogic.currentQuestion].a[2], for: .normal)
            self.scoreText.text = "Score: \(questionLogic.score)"
            self.answerOption2.backgroundColor = UIColor.clear
            self.answerOption1.backgroundColor = UIColor.clear
            self.answerOption3.backgroundColor = UIColor.clear
        }
        
        
    }
    
    func getPercentage(CurrentQuestion: Int) -> Float{
        let percent = Float(CurrentQuestion+1)/Float(questionLogic.questions.count)
        return percent
        
    }
    
}

