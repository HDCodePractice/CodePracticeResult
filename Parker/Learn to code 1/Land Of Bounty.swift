func solveLine(){
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
solveLine()
turnRight()
moveForward()
turnRight()
solveLine()
turnLeft()
moveForward()
turnLeft()
solveLine()
