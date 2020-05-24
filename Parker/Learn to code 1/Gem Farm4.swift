func TurnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func solveRightSide() {
    turnRight()
    moveForward()
    collectGem()
    moveForward()
    collectGem()
}
for i in 1 ... 3 {
    turnLeft()
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    TurnBack()
    turnLeft()
    moveForward()
}
TurnBack()
moveForward()
turnLeft()
turnLeft()
solveRightSide()
TurnBack()
turnRight()
moveForward()
solveRightSide()
TurnBack()
turnRight()
moveForward()
solveRightSide()

