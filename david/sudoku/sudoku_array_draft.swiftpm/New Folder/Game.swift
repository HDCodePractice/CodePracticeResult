import SwiftUI

struct Game{
    var rGet:Int = 0
    var cGet:Int = 0
    
    init(){
        startGame()
    }
    
    mutating func startGame(){
        rGet = 1
        cGet = 4
        gridInit()
        backColorInit()
        backColor(rGet: rGet, cGet: cGet)
    }
}
