func collectOrToggle() {
    moveForward()
    moveForward()
    if isOnGem {
        collectGem()       
    } else if isOnClosedSwitch {
        toggleSwitch()       
    }    
}
collectOrToggle()
collectOrToggle()
turnLeft()
moveForward()
moveForward()
turnLeft()
collectOrToggle()
collectOrToggle()
turnRight()
moveForward()
turnRight()
collectOrToggle()
collectOrToggle()
