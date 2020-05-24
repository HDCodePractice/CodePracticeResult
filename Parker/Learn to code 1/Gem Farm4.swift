func MCTMCT() {
    moveForward()
    collectGem()
    toggleSwitch()
    moveForward()
    collectGem()
    toggleSwitch()
}
func TurnBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func solveLeftSide() {
    turnLeft()
    MCTMCT()
    TurnBack()
    turnLeft()
    moveForward()
}
func solveRightSide() {
    turnRight()
    MCTMCT()
}
for i in 1 ... 3 {
    solveLeftSide()
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
