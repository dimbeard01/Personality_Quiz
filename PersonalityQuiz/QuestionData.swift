//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 21.06.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import Foundation

struct Question {
    var text: String
    var type: ResponseType
    var answer: [Answer]
}

enum ResponseType {
    case single, multiple, ranged
}

struct Answer {
    var text: String
    var type: AnimalType
}

enum AnimalType: Character {
    case dog = "🐶", lion = "🦁", monkey = "🐵", pig = "🐷"
    
    var definition: String {
        switch self {
        case .dog:
            return "Gav - Gav"
        case .lion:
            return "Rrrr"
        case .monkey:
            return "U-u-u"
        case .pig:
            return "Hryu - Hryu"
        }
    }
}
