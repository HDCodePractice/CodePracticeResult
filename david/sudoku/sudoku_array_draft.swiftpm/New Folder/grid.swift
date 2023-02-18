import SwiftUI
var gridArr:[[Int]] = []
func gridInit(){
    gridArr = Array(repeating: Array(repeating: 0, count: 9),count: 9)
    for i in 0...8{
        for j in 0...8{
            if (i/3==0 && j/3==0) || (i/3==1 && j/3==1) || (i/3==2 && j/3==2){
                autoInput(r: i, c: j)
            }
        }
    }
}

