func collectGemTurnAround(){
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}


func solveRow(){
    collectGemTurnAround()
    collectGemTurnAround()
    turnRight()
    moveForward()
    turnLeft()
}    
    




solveRow()
solveRow()
solveRow()
