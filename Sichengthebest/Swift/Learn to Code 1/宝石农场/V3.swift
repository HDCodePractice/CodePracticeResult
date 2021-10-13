var switches = 0
func solveOneSixthGem() {
    turnRight()
    for i in 1...2 {
        moveForward()
        collectGem()
    }
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
}
func solveOneSixthSwitch() {
    for i in 1...2 {
        moveForward()
        toggleSwitch()
        switches += 1
    }
    if switches < 6 {
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnLeft()
        moveForward()
    }
}
for i in 1 ... 3 {
    solveOneSixthGem()
    solveOneSixthSwitch()
}
