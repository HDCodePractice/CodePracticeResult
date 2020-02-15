func collectOrToggle() {
    if isOnGem {
        collectGem()
    } else if isOnClosedSwitch {
        toggleSwitch()
    }
}

func leftSide() {
    for i in 1 ... 9 {
        if isBlocked {
            turnLeft()
        }
        collectOrToggle()
        moveForward()
    }
}

leftSide()
