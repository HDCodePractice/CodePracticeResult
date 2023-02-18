//
//  ViewModel.swift
//  Taro cards
//
//  Created by Hendry shao on 2022-04-13.
//

import SwiftUI

struct ViewModel{
    var viewNumber = 0
    var cardpull : [String] = []
    var whatsc = 0
    var picd = ""
    var picl1 = ""
    var picl2 = ""
    var picl3 = ""
    var picl4 = ""
    var picc1 = ""
    var picc2 = ""
    var picc3 = ""
    var picc4 = ""
    var picc5 = ""
    var uorr = Int.random(in: 1...156)
    var uorr1 = Int.random(in: 1...156)
    var uorr2 = Int.random(in: 1...156)
    var uorr3 = Int.random(in: 1...156)
    var uorr4 = Int.random(in: 1...156)
    var uorr5 = Int.random(in: 1...156)
    var uorr6 = Int.random(in: 1...156)
    var uorr7 = Int.random(in: 1...156)
    var uorr8 = Int.random(in: 1...156)
    var uorr9 = Int.random(in: 1...156)
    let cards = ["0","1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31","32","33","34","35","36","37","38","39","40","41","42","43","44","45","46","47","48","49","50","51","52","53","54","55","56","57","58","59","60","61","62","63","64","65","66","67","68","69","70","71","72","73","74","75","76","77"]
    var body : some View{
        Text("")
    }
    mutating func rcard(){
        let card = cards.shuffled().prefix(78)
         uorr = Int.random(in: 1...156)
         uorr1 = Int.random(in: 1...156)
         uorr2 = Int.random(in: 1...156)
         uorr3 = Int.random(in: 1...156)
         uorr4 = Int.random(in: 1...156)
         uorr5 = Int.random(in: 1...156)
         uorr6 = Int.random(in: 1...156)
         uorr7 = Int.random(in: 1...156)
         uorr8 = Int.random(in: 1...156)
         uorr9 = Int.random(in: 1...156)
        picd = card[20]
        picl1 = card[14]
        picl2 = card[37]
        picl3 = card[70]
        picl4 = card[54]
        picc1 = card[31]
        picc2 = card[53]
        picc3 = card[45]
        picc4 = card[36]
        picc5 = card[76]
    }
}
