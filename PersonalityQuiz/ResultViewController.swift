//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 03.07.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import UIKit

final class ResultViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet private var resultAnswerLabel: UILabel!
    
    // MARK: - Properties
    var responses: [Answer]?
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatePersonalityResult()
        navigationItem.hidesBackButton = true
    }
    
    // MARK: - Actions
    private func calculatePersonalityResult() {
        var frequencyOfAnswers: [CharacterType: Int] = [:]
        guard let theResponses = responses else { return }
        let responsesType = theResponses.map { $0.type }
        
        for response in responsesType {
            frequencyOfAnswers[response] = (frequencyOfAnswers[response] ?? 0) + 1
        }
        
        let frequentAnswerSorted = frequencyOfAnswers.sorted(by: { $0.value > $1.value })
        let mostCommonAnswer = frequentAnswerSorted.sorted { $0.1 > $1.1 }
        guard let firstCommonAnswer = mostCommonAnswer.first else { return }
        let keyAnswer = firstCommonAnswer.key
        resultAnswerLabel.text = "You are \(keyAnswer.rawValue)!"
    }
}
