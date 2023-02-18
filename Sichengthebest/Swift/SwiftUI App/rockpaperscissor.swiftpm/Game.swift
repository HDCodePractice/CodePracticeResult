//
//  File.swift
//  Created by 老房东 on 2022-01-26.
//

import Foundation

struct Game{
    var computer : String = "rock"
    var player: String = "rock"
    var won : Int = 0
    var lost : Int = 0
    var tied : Int = 0
    var result : String {
        if computer == player {
            return "Tied"
        } else if (player=="globe"&&computer=="scissors") ||
            (player=="scissors"&&computer=="newspaper") ||
            (player=="newspaper"&&computer=="globe") {
            return "Won"
        } else if (player=="scissors"&&computer=="globe") ||
            (player=="newspaper"&&computer=="scissors") ||
            (player=="globe"&&computer=="newspaper") {
            return "Lost"
        }
        return "Choose One"
    }
    var running : Bool
    mutating func genComputer(){
        let outcome = ["globe","scissors","newspaper"]
        computer = outcome.randomElement() ?? "globe"
    }
    
}

