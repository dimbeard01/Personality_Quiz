//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 17.06.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    var qustionIndex  = 0
    var answerChosen: [Answer] = []
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var singleStackView: UIStackView!
    @IBOutlet weak var singleButton1: UIButton!
    @IBOutlet weak var singleButton2: UIButton!
    @IBOutlet weak var singleButton3: UIButton!
    @IBOutlet weak var singleButton4: UIButton!
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[qustionIndex].answer
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswer[0])
        case singleButton2:
            answerChosen.append(currentAnswer[1])
        case singleButton3:
            answerChosen.append(currentAnswer[2])
        case singleButton4:
            answerChosen.append(currentAnswer[3])
        default:
            break
        }
        nextQuestion()
    }
    
    @IBOutlet weak var multipleStackView: UIStackView!
    @IBOutlet weak var multiLabel1: UILabel!
    @IBOutlet weak var multiLabel2: UILabel!
    @IBOutlet weak var multiLabel3: UILabel!
    @IBOutlet weak var multiLabel4: UILabel!

    @IBAction func multipleAnswerButtonPressed() {
        let currentAnswer = questions[qustionIndex].answer
        
        if multiSwitch1.isOn {
            answerChosen.append(currentAnswer[0])
        }
        if multiSwitch2.isOn {
            answerChosen.append(currentAnswer[1])
        }
        if multiSwitch3.isOn {
            answerChosen.append(currentAnswer[2])
        }
        if multiSwitch4.isOn {
            answerChosen.append(currentAnswer[3])
        }
        nextQuestion()
    }
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    @IBOutlet weak var multiSwitch2: UISwitch!
    @IBOutlet weak var multiSwitch3: UISwitch!
    @IBOutlet weak var multiSwitch4: UISwitch!

    @IBOutlet weak var rangedStackView: UIStackView!
    @IBOutlet weak var rangedLabel1: UILabel!
    @IBOutlet weak var rangedLabel2: UILabel!
    @IBOutlet weak var rangedSlider: UISlider!
    
    @IBAction func rangedAnswerButtonPressed() {
        let currentAnswer = questions[qustionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswer.count - 1)))
        answerChosen.append(currentAnswer[index])
        nextQuestion()
    }
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    var questions: [Question] = [
        Question(text: "Which food do you like the most?", type: .single, answer: [
            Answer(text: "Steak", type: .dog),
            Answer(text: "Meat", type: .lion),
            Answer(text: "Banan", type: .monkey),
            Answer(text: "Corn", type: .pig)
            ]),
        
        Question(text: "Which activities do you enjoy?", type: .multiple, answer: [
            Answer(text: "Swimming", type: .dog),
            Answer(text: "Sleeping", type: .lion),
            Answer(text: "Cuddling", type: .monkey),
            Answer(text: "Eating", type: .pig)
            ]),
        
        Question(text: "How much do you enjoy car rides?", type: .ranged, answer: [
            Answer(text: "I dislike them", type: .dog),
            Answer(text: "I get a little nervous", type: .lion),
            Answer(text: "I barely notice them", type: .monkey),
            Answer(text: "I love eat", type: .pig)
            ])
        ]
    
    func updateUI() {
        singleStackView.isHidden = true
        multipleStackView.isHidden = true
        rangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(qustionIndex + 1)"
        
        let currentQuestion = questions[qustionIndex]
        let currentAnswer = currentQuestion.answer
        let totalProgress = Float(qustionIndex) / Float(questions.count)

        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultilpeStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }
    
    func updateSingleStack(using answer: [Answer]) {
        singleStackView.isHidden = false
        singleButton1.setTitle(answer[0].text, for: .normal)
        singleButton2.setTitle(answer[1].text, for: .normal)
        singleButton3.setTitle(answer[2].text, for: .normal)
        singleButton4.setTitle(answer[3].text, for: .normal)
    }
    
    func updateMultilpeStack(using answer: [Answer]) {
        multipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false
        multiLabel1.text = answer[0].text
        multiLabel2.text = answer[1].text
        multiLabel3.text = answer[2].text
        multiLabel4.text = answer[3].text
    }
    
    func updateRangedStack(using answer: [Answer]) {
        rangedStackView.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answer.first?.text
        rangedLabel2.text = answer.last?.text
    }
    
    func nextQuestion(){
        qustionIndex += 1
        
        if qustionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultsViewController = segue.destination as! ResultsViewController
            resultsViewController.responses = answerChosen
        }
    }
}
