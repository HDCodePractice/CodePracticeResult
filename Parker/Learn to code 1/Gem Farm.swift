func solveSquare() {
    moveForward()
    collectGem()
    toggleSwitch()
}
for i in 1 ... 3 {
    turnLeft()
    solveSquare()
    solveSquare()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    solveSquare()
    solveSquare()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    turnRight()
    moveForward()
}

