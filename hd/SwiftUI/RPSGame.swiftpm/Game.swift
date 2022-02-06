////
////  File.swift
////  Test
////
////  Created by 老房东 on 2022-01-26.
////
//
//import Foundation
//
//struct Game{
//    var computer : String = "rock"
//    var player: String = "rock"
//    var won : Int = 0
//    var lost : Int = 0
//    var tied : Int = 0
//    var starting : Bool = true
//    
//    var result : String {
//        if computer == player {
//            return "Tied"
//        }
//        
//        if (player=="rock"&&computer=="scissors") ||
//            (player=="scissors"&&computer=="paper") ||
//            (player=="paper"&&computer=="rock") {
//            return "Won"
//        }
//        
//        if (player=="scissors"&&computer=="rock") ||
//            (player=="paper"&&computer=="scissors") ||
//            (player=="rock"&&computer=="paper") {
//            return "Lost"
//        }
//        return "Choose One"
//    }
//    
//    mutating func genComputer(){
//        let outcome = ["rock","scissors","paper"]
//        computer = outcome.randomElement() ?? "rock"
//    }
//    
//}
