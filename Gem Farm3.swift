func moveSolve() {
    moveForward()
    collectGem()
    toggleSwitch()
}
func TurnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnRight()
    moveForward()
}
func solveLeftSide() {
    turnLeft()
    moveSolve()
    moveSolve()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnLeft()
    moveForward()
}
func solveRightSide() {
    turnRight()
    moveSolve()
    moveForward()
    collectGem()
}
for i in 1 ... 3 {
    solveLeftSide()
}
turnLeft()
turnLeft()
moveForward()
moveForward()
moveForward()
turnLeft()
turnLeft()
solveRightSide()
TurnBack()
solveRightSide()
TurnBack()
solveRightSide()
