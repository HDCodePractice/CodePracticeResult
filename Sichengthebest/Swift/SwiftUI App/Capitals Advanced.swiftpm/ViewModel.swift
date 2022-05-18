//
//  File.swift
//  Capitals Advanced
//
//  Created by Sicheng Jiang on 2022-05-14.
//

import SwiftUI

class ViewModel: ObservableObject {
    @Published var level: Level = .normal
    @Published var totalQuestion: Int = 10
    @Published var currentIndex: Int = 1
    @Published var reachEnded: Bool = false
    
    @Published var question: Question = Question(title: "", flag: "", answers: [], rightAnswerIndex: 0)
    var countryList: [Country] = []
    
    func startExam(level:Level) {
        self.level = level
        currentIndex = 0
        reachEnded = false
        countryList = Array(level.countries.shuffled().prefix(10))
    }
    
    func getQuestion() {
        let country = countryList[currentIndex]
        let index = level.countries.firstIndex {
            $0.capitalName == country.capitalName
        } ?? 0
        var allCountries = level.countries
        allCountries.remove(at: index)
        let wrongCountries = allCountries.shuffled().prefix(2)
        var answers: [Question.Answer] = []
        answers.append(Question.Answer(name: country.capitalName, right: true, click: false))
        for c in wrongCountries {
            answers.append(Question.Answer(name: c.capitalName, right: false, click: false))
        }
        
        question = Question(title: country.countryName, flag: country.flag, answers: answers, rightAnswerIndex: 0)
        question.answers.append(question.wrongAnswers.shuffled().first!)
        question.rightAnswerIndex = question.answers.firstIndex(where: {$0.name == country.capitalName}) ?? 0
    }
    
    func nextQuestion() {
        if currentIndex<totalQuestion-1{
            currentIndex += 1
            getQuestion()
        } else {
            reachEnded = true
        }
    }
}
