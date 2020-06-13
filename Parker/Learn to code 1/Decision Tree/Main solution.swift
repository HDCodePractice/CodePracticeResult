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
func solveLeftSide() {
    theFunction()
    turnLeft()
    moveForward()
    turnLeft()
}
for i in 1 ... 5 {
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        solveLeftSide()
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
