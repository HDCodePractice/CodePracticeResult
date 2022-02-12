//
//  Game.swift
//  Flag Game
//
//  Created by Jaden Cheung on 1/29/22.
//

import Foundation
import SwiftUI
struct Game{
    var flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨","🇬🇧","🇷🇺","🇯🇵","🇬🇸","🇮🇹", "🇫🇷","🇩🇪","🇦🇷","🇵🇹","🇪🇸"]
    var countries = ["Canada ","United States ","China ","St. Vincent & Grenadines ","United Kingdom ","Russia ","Japan ","South Georgia & South Sandwich Islands ","Italy ","France ","Germany ","Argentina ","Portugal ","Spain "]
    var answers : [String] = []
    var question : String = ""
    var gameStart : Bool = false
    var correct : String = ""
    var answer : String = ""
    var score : Int = 0
    var questionNumber : Int = 0
    var button : String = "Play"
    var play : String = ""
    var stopper : Bool = false
    var scoreText : String = ""
    var charger : Int = 0
    var exams : [String] = []
    var current : Int = 0
    var total : Int = 10
    var source : [Int] = []
    var flog : [String] = []
    
    mutating func newGame(){
        exams = Array(countries.shuffled().prefix(10))
        total = exams.count
        
        for i in 0..<countries.count {
            source.append(i)
        }
        let currentIndex = countries.firstIndex(of: exams[current]) ?? 0
        source.remove(at: currentIndex)
        source = Array(source.shuffled().prefix(3))
        source.append(currentIndex)
        source.shuffle()
        print(source)

        // source = [0,1,2,3,4,5,6,7,8,9.....countries.cont]
        // exam[current] -> source firstIndex(of: "maxime") -> currentIndex(3)
        // source.remove(currentIndex) [0,1,2,3,4,5,6,7,8]
        // source.shuffled().prefix(3) - [6,2,1]
        // source.append(currentIndex -> [6,2,1,3]
        // source.shuffle() -> [1,3,6,2]
        
        
        
        
        
        let rCountries = countries[currentIndex]
        flog.append(countries[source[0]])
        flog.append(countries[source[1]])
        flog.append(countries[source[2]])
        flog.append(countries[source[3]])
        countries.remove(at: currentIndex)
        
        print(rCountries)
        questionNumber += 1
        charger += 1
        if charger == 0{
            play = "start"
        }
        if charger >= 1{
            play = "cont"
        }
        if charger == 10{
            play = "stop"
            stopper = true
            
            
        }
        
        if let q = Optional(rCountries) {
            question = String(q)
            if let index = countries.firstIndex(of:String(q)){
                correct = flags[currentIndex]
            }
            answers = []
            for c in rCountries.shuffled(){
                if let index = countries.firstIndex(of: String(c)){
                    answers.append(flags[currentIndex])
                }
            }
            gameStart = true
        }
//        flog.remove(at: countries[source[0]])
//        flog.remove(at:  countries[source[1]])
//        flog.remove(at:  countries[source[2]])
//        flog.remove(at:  countries[source[3]])
    }
    mutating func toggleAnswer(tAnswer: String){
        answer = tAnswer
        gameStart = false
        if tAnswer == correct{
            score += 1
        }
    }
    mutating func tenQuestions(){
        if play == "start"{
            button = "Play"
        }else if play == "cont"{
            button = "Next"
            scoreText = ""
        }else if play == "stop"{
            button = "Play Again"
            scoreText = "Score: \(score)/10"
        }
    }
}

