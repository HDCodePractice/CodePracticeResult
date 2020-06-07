func collectOrToggle() {
    for i in 1 ... 4 {
        moveForward()
        if isOnClosedSwitch {
            toggleSwitch()
        }
        else if isOnGem {
            collectGem()
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
