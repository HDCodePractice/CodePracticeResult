while !isOnGem {
    if isOnClosedSwitch {
        toggleSwitch()
        MasterCode()
    } else {
        moveForward()
    }
}
func MasterCode() {
    if !isBlocked {
        turnRight()
        moveForward()
    }
    else if isBlocked {
        turnLeft()
        moveForward()
    }
}
collectGem()
