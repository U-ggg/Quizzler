//
//  Struct.swift
//  quationuizzler
//
//  Created by sidzhe on 10.04.2023.
//

import UIKit

struct AskMe {
    
    let quation: String
    let answerOne: String
    let answerTwo: String
    let answerRight: String
    
}

struct QuastionData {
    
    let quations = [
        AskMe(quation: "Which is the largest organ in the human body?",
              answerOne: "Heart",
              answerTwo: "Large Intestine",
              answerRight: "Skin"),
        
        AskMe(quation: "Five dollars is worth how many nickels?",
              answerOne: "50",
              answerTwo: "25",
              answerRight: "100"),
        
        AskMe(quation: "What do the letters in the GMT time zone stand for?",
              answerOne: "Global Meridian Time",
              answerTwo: "General Median Time",
              answerRight: "Greenwich Mean Time"),
        
        AskMe(quation: "What is the French word for 'hat'?",
              answerOne: "Écharpe",
              answerTwo: "Bonnet",
              answerRight: "Chapeau"),
        
        AskMe(quation: "In past times, what would a gentleman keep in his fob pocket",
              answerOne: "Handkerchief",
              answerTwo: "Notebook",
              answerRight: "Watch"),
        
        AskMe(quation: "How would one say goodbye in Spanish?",
              answerOne: "Au Revoir",
              answerTwo: "Salir",
              answerRight: "Adiós"),
        
        AskMe(quation: "Which of these colours is NOT featured in the logo for Google?",
              answerOne: "Green",
              answerTwo: "Blue",
              answerRight: "Orange"),
        
        AskMe(quation: "What alcoholic drink is made from molasses?",
              answerOne: "Whisky",
              answerTwo: "Gin",
              answerRight: "Rum"),
        
        AskMe(quation: "What type of animal was Harambe?",
              answerOne: "Panda",
              answerTwo: "Crocodile",
              answerRight: "Gorilla"),
        
        AskMe(quation: "Where is Tasmania located?",
              answerOne: "Indonesia",
              answerTwo: "Scotland",
              answerRight: "Australia")
    ]
    
    var numberOfquations = 0
    var boolValue = false
    var result = 0
    var rightAnswers = 0 { didSet { result = oldValue }}
    
    func setButtons(_ buttonOne: UIButton,_ buttonTwo: UIButton, _ buttonThree: UIButton) {
        var buttonList = [quations[numberOfquations].answerOne,
                          quations[numberOfquations].answerTwo,
                          quations[numberOfquations].answerRight]
        buttonList.shuffle()
        
        buttonOne.setTitle(buttonList[0], for: .normal)
        buttonTwo.setTitle(buttonList[1], for: .normal)
        buttonThree.setTitle(buttonList[2], for: .normal)
    }
    
    mutating func checkAnswer(answer: String) -> Bool {
        if quations[numberOfquations].answerRight == answer {
            rightAnswers += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuastionText() -> String {
        quations[numberOfquations].quation
    }
    
    func progressIndicator() -> Float {
        let value = Float(numberOfquations + 1) / Float(quations.count)
        return value
    }
    
    mutating func nextQuastion() {
        if numberOfquations != quations.count - 1 {
            numberOfquations += 1
            boolValue = false
        }
        else if numberOfquations == quations.count - 1 {
            numberOfquations = 0
            rightAnswers = 0
            boolValue = true
        }
    }
    
    func resultString(_ result: Int) -> String {
        if result < (quations.count - 1) / 2 {
            return "You can try again."
        }
        else if result == (quations.count - 1) {
            return "Perfect!"
        } else {
            return "Good job!"
        }
    }
}
