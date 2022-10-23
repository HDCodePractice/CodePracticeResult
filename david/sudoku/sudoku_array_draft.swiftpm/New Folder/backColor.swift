import SwiftUI
var backColors:[[Color]]=[]

func backColorInit(){
    
    backColors = Array(repeating: Array(repeating: .white, count: 9), count: 9)
}

func backColor(rGet:Int,cGet:Int){
    
    for i in 0..<9{
        backColors[i][cGet] = .white
            .opacity(0.8)
        backColors[rGet][i] = .white
            .opacity(0.8)
    }
    for i in 0..<3{
        for j in 0..<3{
            backColors[rGet/3*3+i][cGet/3*3+j] = .white
                .opacity(0.8)
        }
    }
    backColors[rGet][cGet] = .white 
        .opacity(0.6)
    
}
