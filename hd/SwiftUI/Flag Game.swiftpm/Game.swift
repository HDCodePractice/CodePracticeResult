//
//  Game.swift
//  Flag Game
//
//  Created by 老房东 on 2022-01-29.
//

import Foundation

struct Game{
    let flags = ["🇨🇦","🇺🇸","🇨🇳","🇻🇨"]
    let countries = ["Canada","United States","China","St. Vincent & Grenadines"]
    
    func newGame() -> [String]?{
        if let ct = countries.shuffled().first{
            if let index = countries.firstIndex(of: ct){
                let flag = flags[index]
                return [ct,flag]
            }
        }
        return nil
    }
}
