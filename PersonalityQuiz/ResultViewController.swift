//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 03.07.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var resultAnswerLabel: UILabel!
    
    // MARK: - Properties
    var responses: [Answer]!
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Actions
    func calculatePersonalityResult() {
        var frequencyOfAnswers: [CharacterType: Int] = [:]
        let responsesType = responses.map { $0.type }
        
        for response in responsesType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by:
        { (pair1, pair2) -> Bool in
            return pair1.value > pair2.value
        })
        
        let mostCommonAnswer = frequentAnswerSorted.sorted { $0.1 > $1.1 }.first!.key
        resultAnswerLabel.text = "You are \(mostCommonAnswer.rawValue)!"
    }
}
