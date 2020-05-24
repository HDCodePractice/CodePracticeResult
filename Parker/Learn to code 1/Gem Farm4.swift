func solveBlock() {
    moveForward()
    collectGem()
    toggleSwitch()
    moveForward()
    collectGem()
    toggleSwitch()
}
func goBack() {
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
turnLeft()
for i in 1 ... 2 {
    solveBlock()
    goBack()
    turnLeft()
    moveForward()
    turnLeft()
}
solveBlock()
goBack()
for i in 1 ... 2 {
    solveBlock()
    goBack()
    turnLeft()
    moveForward()
    turnLeft()
}
solveBlock()
