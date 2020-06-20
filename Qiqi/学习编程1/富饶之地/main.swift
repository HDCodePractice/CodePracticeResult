func solveOneLine(){
    moveForward()
    while !isBlocked {
        if isOnClosedSwitch {
            toggleSwitch()
        } else if isOnGem {
            collectGem()
        }
        moveForward()
    }
}
solveOneLine()
turnRight()
moveForward()
turnRight()
solveOneLine()
turnLeft()
moveForward()
turnLeft()
solveOneLine()
