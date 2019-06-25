//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 17.06.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var question: [Question] = [
        Question(text: "which food do you like the most?", type: .single, answer: [
            Answer(text: "steak", type: .dog),
            Answer(text: "meat", type: .lion),
            Answer(text: "banan", type: .monkey),
            Answer(text: "corn", type: .pig)
            ]),
        
        Question(text: "Which activities do you enjoy?", type: .multiple, answer: [
                    Answer(text: "Swimming", type: .dog),
                    Answer(text: "Sleeping", type: .lion),
                    Answer(text: "Cuddling", type: .monkey),
                    Answer(text: "Eating", type: .pig)
            ]),
        
        Question(text: "How much do you enjoy car rides?", type: .ranged, answer: [
                    Answer(text: "I dislike them", type: .dog),
                    Answer(text: "I get a little nervous",
                           type: .lion),
                    Answer(text: "I barely notice them",
                           type: .monkey),
                    Answer(text: "I love eat", type: .pig)
            ])
        ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
