//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Admin on 16.09.17.
//  Copyright © 2017 NS. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var questionIndex = 0
    
    var answersChosen: [Answer] = []
    
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multipleLabel1: UILabel!
    @IBOutlet weak var multipleLabel2: UILabel!
    @IBOutlet weak var multipleLabel3: UILabel!
    @IBOutlet weak var multipleLabel4: UILabel!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    
    
    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Fish", type: .cat),
                    Answer(text: "Carrots", type: .rabbit),
                    Answer(text: "Corn", type: .turtle)
                    ]),
        Question(text: "Which activity do you enjoy?",
                 type: .multiple,
                 answers: [
                    Answer(text: "Eating", type: .dog),
                    Answer(text: "Sleeping", type: .cat),
                    Answer(text: "Cuddling", type: .rabbit),
                    Answer(text: "Swimming", type: .turtle)
            ]),
        Question(text: "How much do you enjoy car rides?",
                 type: .ranged,
                 answers: [
                    Answer(text: "Love them", type: .dog),
                    Answer(text: "Dislike", type: .cat),
                    Answer(text: "Nervous", type: .rabbit),
                    Answer(text: "Don't care", type: .turtle)
            ]),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()

        updateUI()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateUI() {
        
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = currentQuestion.answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        navigationItem.title = "Question #\(questionIndex+1)"
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            //singleStackView.isHidden = false
            updateSingleStack(using: currentAnswers)
        case .multiple:
            //multipleStackView.isHidden = false
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            //rangedStackView.isHidden = false
            updateRangedStack(using: currentAnswers)
        }
        
    }
    
    func updateSingleStack(using answers: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multipleLabel1.text = answers[0].text
        multipleLabel2.text = answers[1].text
        multipleLabel3.text = answers[2].text
        multipleLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answers.first?.text
        rangedLabel2.text = answers.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        
        let currentAnswers = questions[questionIndex].answers
        
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
        nextQuestion()
        
    }
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        if multiSwitch1.isOn {
            answersChosen.append(currentAnswers[0])
        }
        
        if multiSwitch2.isOn {
            answersChosen.append(currentAnswers[1])
        }
        
        if multiSwitch3.isOn {
            answersChosen.append(currentAnswers[2])
        }
        
        if multiSwitch4.isOn {
            answersChosen.append(currentAnswers[3])
        }
        
        nextQuestion()
    }
    
        
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswers = questions[questionIndex].answers
        
        let index = Int(round(rangedSlider.value*Float(currentAnswers.count-1)))
        answersChosen.append(currentAnswers[index])
        
        nextQuestion()
        
    }
    
    func nextQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    
      override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answersChosen
        }
    }
   
}
