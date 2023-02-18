import SwiftUI

func autoInput(r:Int,c:Int){
    var numbers:[Int] = [1,2,3,4,5,6,7,8,9]
    numbers.shuffle()
    
    for i in 0..<3{
        for j in 0..<3{
            gridArr[r/3*3+i][c/3*3+j] = numbers[0]
            numbers.removeFirst()
        }
    }
}
