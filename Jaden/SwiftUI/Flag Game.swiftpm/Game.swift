//
//  Game.swift
//  Flag Game
//
//  Created by Jaden Cheung on 1/29/22.
//

import Foundation
struct Game{
    let flags =  ["🇨🇦","🇺🇸","🇨🇳","🇻🇨"]
    let countries = ["Canada", "United States", "China", "St. Vincent & Grenadines"]
    
    func newGame() -> [String]?{
        if let ct = countries.shuffled().first{
            if let index = countries.firstIndex(of: ct){
                let flag = flags[index]
                return [ct, flag]
                
            }

        }
        return nil
    }
}
