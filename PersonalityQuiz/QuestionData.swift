//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Admin on 16.09.17.
//  Copyright © 2017 NS. All rights reserved.
//

import Foundation


struct Question {
    var text: String
    var type: ResponseType
    var answers: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", cat = "🐱", rabbit = "🐰", turtle = "🐢"
    
    var definition: String {
        switch self {
        case .dog:
            return "You are and blah blah... dog"
        case .cat:
            return "You are and blah blah... cat"
        case .rabbit:
            return "You are and blah blah... rabbit"
        case .turtle:
            return "You are and blah blah... turtle"
        }
    }
    
}
