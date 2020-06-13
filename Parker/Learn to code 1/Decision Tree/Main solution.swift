func theFunction() {
    turnLeft()
    moveForward()
    collectGem()
    turnLeft()
}
func turnMove3() {
    turnRight()
    moveForward()
    moveForward()
    moveForward()
}
for i in 1 ... 5 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        theFunction()
        turnLeft()
        moveForward()
        turnLeft()
    }
    else if isOnGem {
        collectGem()
        turnMove3()
        theFunction()
        turnLeft()
        moveForward()
        turnMove3()
        turnRight()
    }
}
