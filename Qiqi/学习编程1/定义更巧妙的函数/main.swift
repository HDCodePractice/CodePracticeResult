func collectOrToggle() {
    for i in 1 ... 2 {
        moveForward()
        moveForward()
        if isOnGem {
            collectGem()
        } else if isOnClosedSwitch {
            toggleSwitch()
        }
    }
}
collectOrToggle()
turnLeft()
moveForward()
moveForward()
turnLeft()
collectOrToggle()
turnRight()
moveForward()
turnRight()
collectOrToggle()
