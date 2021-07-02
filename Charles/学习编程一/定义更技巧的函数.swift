func collectOrToggle() {
  moveForward()
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
        if isOnOpenSwitch {
            moveForward()
            
        }
        
    }
    if isOnGem {
        collectGem()
        
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

