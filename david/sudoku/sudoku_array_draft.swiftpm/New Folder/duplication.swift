import SwiftUI

var backColorTemp:[[Color]] = []

func isDuplic(r:Int,c:Int)->Bool{
    
    for i in 0..<9{
        for j in 0..<9{
            if gridArr[i][j] == gridArr[r][c]{
                if !(i == r && j == c){
                    if r/3==i/3 && c/3==j/3{
                        return true
                    }else if r==i || c==j{
                        return true
                    }
                    
                }
            }
        }
    }
    return false
}

func showDuplic(r:Int,c:Int){
    
    for i in 0..<9{
        for j in 0..<9{
            if backColors[i][j] != .red.opacity(0.85){
                if !(i == r && j == c){
                    
                    if gridArr[i][j] == gridArr[r][c]{
                        if (r/3==i/3 && c/3==j/3) || (r==i || c==j){
                            backColors[i][j] = .red
                                .opacity(0.85)
                        }else{
                            backColors[i][j] = .white 
                                .opacity(0.6)
                        }
                    }
                }
            }
        }
    }
    
    backColorTemp = backColors
    if isDuplic(r: r, c: c){
        backColorTemp[r][c] = .red.opacity(0.85)
        
    }
}
