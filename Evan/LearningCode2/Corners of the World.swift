func turnAround() {
    turnLeft()
    turnLeft()
}
greenPortal.isActive = false
turnLeft()
moveForward()
moveForward()
for i in 1 ... 2 {
    greenPortal.isActive = false
    orangePortal.isActive = false
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    greenPortal.isActive = true
    orangePortal.isActive = true
    moveForward()
}
turnLeft()
orangePortal.isActive = false
moveForward()
moveForward()
moveForward()
for i in 1 ... 2 {
    greenPortal.isActive = false
    orangePortal.isActive = false
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    moveForward()
    turnRight()
    moveForward()
    if isOnGem {
        collectGem()
    }
    else if isOnClosedSwitch {
        toggleSwitch()
    }
    turnAround()
    greenPortal.isActive = true
    orangePortal.isActive = true
    moveForward()
}
