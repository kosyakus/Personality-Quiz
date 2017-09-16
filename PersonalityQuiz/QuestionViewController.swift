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
    
    @IBOutlet weak var singleStackView: UIStackView!
    
    @IBOutlet weak var multipleStackView: UIStackView!
    
    @IBOutlet weak var rangedStackView: UIStackView!
    
    
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
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
