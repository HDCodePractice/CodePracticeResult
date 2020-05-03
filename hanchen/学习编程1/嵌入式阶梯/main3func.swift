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
    mostSimple()
    collectGemTurnAround()
    mostSimple()
    collectGemTurnAround()
}
func mostSimple(){
    turnLeft()
    moveForward()
    turnLeft()
}
solveRow()
solveRow()
