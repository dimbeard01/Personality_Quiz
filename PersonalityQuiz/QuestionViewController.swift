//
//  QuestionViewController.swift
//  PersonalityQuiz
//
//  Created by Dima Surkov on 03.07.2019.
//  Copyright © 2019 Dima Surkov. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet var singleSV: UIStackView!
    @IBOutlet var singleButton1: UIButton!
    @IBOutlet var singleButton2: UIButton!
    @IBOutlet var singleButton3: UIButton!
    @IBOutlet var singleButton4: UIButton!
    @IBOutlet var singleButton5: UIButton!
    
    @IBOutlet var multipleSV: UIStackView!
    @IBOutlet var multipleLabel1: UILabel!
    @IBOutlet var multipleLabel2: UILabel!
    @IBOutlet var multipleLabel3: UILabel!
    @IBOutlet var multipleLabel4: UILabel!
    @IBOutlet var multipleLabel5: UILabel!
    @IBOutlet var multipleSwitch1: UISwitch!
    @IBOutlet var multipleSwitch2: UISwitch!
    @IBOutlet var multipleSwitch3: UISwitch!
    @IBOutlet var multipleSwitch4: UISwitch!
    @IBOutlet var multipleSwitch5: UISwitch!
    @IBOutlet var submitAnswerButton: UIButton!
    
    @IBOutlet var rangedSV: UIStackView!
    @IBOutlet var rangedSlider: UISlider!
    @IBOutlet var rangedLabel1: UILabel!
    @IBOutlet var rangedLabel2: UILabel!
    
    @IBOutlet var questionProgressView: UIProgressView!
    @IBOutlet var questionLabel: UILabel!
    
    // MARK: - Properties
    var questionIndex = 0
    var answerChosen = [Answer]()
    var questions: [Question] = [
        Question(text: "What is your favorite thing?",
                 type: .single,
                 answer: [
                    Answer(text: "Lightsaber", type: .darth),
                    Answer(text: "Donuts", type: .homer),
                    Answer(text: "Mirror", type: .princess),
                    Answer(text: "Guns", type: .neo),
                    Answer(text: "Internet", type: .geek)]),
        
        Question(text: "What is your favorite color?",
                 type: .multiple,
                 answer: [
                    Answer(text: "Red", type: .darth),
                    Answer(text: "Yellow", type: .homer),
                    Answer(text: "Pink", type: .princess),
                    Answer(text: "Black", type: .neo),
                    Answer(text: "Green", type: .geek)]),
                 
        Question(text: "What do you like to do?",
                 type: .multiple,
                 answer: [
                    Answer(text: "Kill", type: .darth),
                    Answer(text: "Eat", type: .homer),
                    Answer(text: "Dance", type: .princess),
                    Answer(text: "Shoot", type: .neo),
                    Answer(text: "Don't sleep", type: .geek)]),
    
        Question(text: "How much do you love a kids?",
                 type: .ranged,
                 answer: [
                    Answer(text: "Not love", type: .darth),
                    Answer(text: "Not Really", type: .geek),
                    Answer(text: "Who is it?", type: .neo),
                    Answer(text: "Normal", type: .homer),
                    Answer(text: "Very", type: .princess)]
        )]
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    // MARK: - Actions
    func updateUI() {
        singleSV.isHidden = true
        multipleSV.isHidden = true
        rangedSV.isHidden = true
        
        navigationItem.title = "Question \(questionIndex + 1)"
        let currentQuestion = questions[questionIndex]
        let currentAnswer = currentQuestion.answer
        let totalProgress = Float(questionIndex) / Float(questions.count)
        questionProgressView.setProgress(totalProgress, animated: true)
        questionLabel.text = currentQuestion.text

        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswer)
        case .multiple:
            updateMultipleStack(using: currentAnswer)
        case .ranged:
            updateRangedStack(using: currentAnswer)
        }
    }

    func updateSingleStack(using answer: [Answer]) {
        singleSV.isHidden = false
        singleButton1.setTitle(answer[0].text, for: .normal)
        singleButton2.setTitle(answer[1].text, for: .normal)
        singleButton3.setTitle(answer[2].text, for: .normal)
        singleButton4.setTitle(answer[3].text, for: .normal)
        singleButton5.setTitle(answer[4].text, for: .normal)
        
    }
    
    func updateMultipleStack(using answer: [Answer]) {
        multipleSV.isHidden = false
        multipleLabel1.text = answer[0].text
        multipleLabel2.text = answer[1].text
        multipleLabel3.text = answer[2].text
        multipleLabel4.text = answer[3].text
        multipleLabel5.text = answer[4].text
        
        multipleSwitch1.isOn = false
        multipleSwitch2.isOn = false
        multipleSwitch3.isOn = false
        multipleSwitch4.isOn = false
        multipleSwitch5.isOn = false
        
    }
    
    func updateRangedStack(using answer: [Answer]){
        rangedSV.isHidden = false
        rangedSlider.setValue(0.5, animated: false)
        rangedLabel1.text = answer.first?.text
        rangedLabel2.text = answer.last?.text
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        
        switch sender {
        case singleButton1:
            answerChosen.append(currentAnswer[0])
        case singleButton2:
            answerChosen.append(currentAnswer[1])
        case singleButton3:
            answerChosen.append(currentAnswer[2])
        case singleButton4:
            answerChosen.append(currentAnswer[3])
        case singleButton5:
            answerChosen.append(currentAnswer[4])
        default:
            break
        }
        newQuestion()
    }
    
    @IBAction func multipleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        
        if multipleSwitch1.isOn {
            answerChosen.append(currentAnswer[0])
        }
        
        if multipleSwitch2.isOn {
            answerChosen.append(currentAnswer[1])
        }
        
        if multipleSwitch3.isOn {
            answerChosen.append(currentAnswer[2])
        }
        
        if multipleSwitch4.isOn {
            answerChosen.append(currentAnswer[3])
        }
        
        if multipleSwitch5.isOn {
            answerChosen.append(currentAnswer[4])
        }
        
        newQuestion()
    }
    
    @IBAction func rangedAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswer = questions[questionIndex].answer
        let index = Int(round(rangedSlider.value * Float(currentAnswer.count - 1)))
        answerChosen.append(currentAnswer[index])
        newQuestion()
    }
    
    
    func newQuestion() {
        questionIndex += 1
        
        if questionIndex < questions.count {
            updateUI()
        } else {
            performSegue(withIdentifier: "ResultSegue", sender: nil)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultSegue" {
            let resultViewController = segue.destination as! ResultViewController
            resultViewController.responses = answerChosen
        }
    }
}
