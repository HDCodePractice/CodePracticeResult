func rollRight() {
    turnRight()
    while !isOnClosedSwitch && !isOnOpenSwitch {
        if isOnGem {
            collectGem()
        }
        if isBlocked {
            turnLeft()
        }
        moveForward()
    }
}

func rollLeft() {
    turnLeft()
    while !isOnGem {
        if isBlocked {
            turnRight()
        }
        if isOnClosedSwitch {
            toggleSwitch()
        }
        moveForward()
    }
}

moveForward()
for i in 1 ... 3 {
    rollRight()
    rollLeft()
}
rollRight()
