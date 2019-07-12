//
//  QuestionData.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 03.07.2019.
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
    var type: CharacterType
}

enum CharacterType: String {
    case darth = "Darth Vader", homer = "Homer Sipson", geek = "Insane Hacker", neo = "Neo", princess = "Disney Princess"
}

