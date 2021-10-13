func solveOneSixthGem() {
    moveForward()
    collectGem()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
}
func solveOneSixthSwitch() {
    moveForward()
    toggleSwitch()
    moveForward()
    toggleSwitch()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func transition() {
    moveForward()
    moveForward()
    turnRight()
    moveForward()
    turnLeft()
}
turnLeft()
for i in 1 ... 2 {
    solveOneSixthSwitch()
    solveOneSixthGem()
    transition()
}
solveOneSixthSwitch()
solveOneSixthGem()
