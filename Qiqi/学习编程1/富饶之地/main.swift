func getGS() {
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
    }
    moveForward()
}

func finish() {
    while !isBlocked {
        getGS()
    }
}

finish()
turnRight()
moveForward()
turnRight()
finish()
turnLeft()
moveForward()
turnLeft()
finish()
