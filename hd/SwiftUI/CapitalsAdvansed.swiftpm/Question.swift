//
//  Question.swift
//  CapitalsAdvansed
//
//  Created by 老房东 on 2022-05-07.
//

import Foundation

struct Question: Identifiable{
    let id : UUID = UUID()
    var title:String
    var answers: [Answer]
    var rightAnswerIndex: Int
    
    struct Answer: Identifiable {
        let id: UUID = UUID()
        var name:String
        var right:Bool
        var click:Bool
    }
}
