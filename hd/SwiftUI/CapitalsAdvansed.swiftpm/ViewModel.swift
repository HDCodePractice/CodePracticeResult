//
//  ViewModel.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import Foundation

class ViewModel: ObservableObject{
    @Published var level : Level = .normal
    @Published var totalQuestion: Int = 10
    @Published var currentIndex: Int = 1
    @Published var reachEnded : Bool = false
    @Published var isSelected : Bool = false
    @Published var rightCount = 0
    
    @Published var question: Question = Question(
        title: "", flag: "",
        answers: [],
        rightAnswerIndex: 0)
    
    var countryList : [Country] = []
    
    func startExam(level: Level){
        self.level = level
        currentIndex = 0
        reachEnded = false
        countryList = Array(level.countries.shuffled().prefix(10))
        rightCount = 0
        getQuestion()
    }
    
    func getQuestion(){
        let country = countryList[currentIndex]
        let index = level.countries.firstIndex {
            $0.capitalName == country.capitalName
        } ?? 0
        var allCountries = level.countries
        allCountries.remove(at: index)
        let wrongCountries = allCountries.shuffled().prefix(2)
        
        var answers : [Question.Answer] = []
        // 加入正确答案
        answers.append(Question.Answer(name: country.capitalName, right: true, click: false))
        // 加两个正常的错误数据
        for c in wrongCountries{
            answers.append(Question.Answer(name: c.capitalName, right: false, click: false))
        }
        
        question = Question(
            title: country.countryName,
            flag: country.flag,
            answers: answers,
            rightAnswerIndex: 0
        )
        
        question.answers.append(question.wrongAnswers.shuffled().first!)
        question.answers.shuffle()
        question.rightAnswerIndex = question.answers.firstIndex(where: {
            $0.name == country.capitalName
        }) ?? 0
        isSelected = false
    }
    
    func nextQuestion(){
        if currentIndex<totalQuestion-1{
            currentIndex += 1
            getQuestion()
        }else{
            reachEnded = true
        }
    }
    
    func tapAnswer(answer: Question.Answer){
        if isSelected{
            return
        }
        let tapIndex = question.answers.firstIndex(where: {
            $0.name == answer.name
        })
        if let tapIndex = tapIndex{
            question.answers[tapIndex].click = true
            if question.answers[tapIndex].right==false{
                for i in 0...question.answers.count-1{
                    if question.answers[i].right{
                        question.answers[i].click=true
                    }
                }
            }else{
                rightCount+=1
            }
        }
        isSelected = true
    }
    
    func tapNext(){
        nextQuestion()
    }
}
