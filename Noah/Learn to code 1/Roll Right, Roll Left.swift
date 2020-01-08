func rollright() {
    turnRight()
    while !isOnClosedSwitch {
        if isOnGem {
            collectGem()
        }
        if isBlocked {
            turnLeft()
        }
        moveForward()
    }
}

func rollleft() {
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

func lastroll() {
    turnRight()
    while !isOnOpenSwitch {
        if isOnGem {
            collectGem()
        }
        if isBlocked {
            turnLeft()
        }
        moveForward()
    }
}

moveForward()
for i in 1 ... 3 {
    rollright()
    rollleft()
}
lastroll()


