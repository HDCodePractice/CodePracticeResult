func collectingProgress() {
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isOnGem {
        collectGem()
    }
    moveForward()
}

func cutline() {
    while !isBlocked {
        collectingProgress()
    }
}

cutline()
turnRight()
moveForward()
turnRight()
cutline()
turnLeft()
moveForward()
turnLeft()
cutline()
