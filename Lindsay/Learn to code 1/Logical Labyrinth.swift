moveForward()
gemSwitch()
moveForward()
justSwitch()
moveForward()
moveForward()
gemSwitch()
toggleSwitch()
turnLeft()
moveForward()
collectGem()
moveForward()
gemSwitch()    
    


func gemSwitch() {
    if isBlockedLeft && isOnClosedSwitch && isOnGem {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
        moveForward()
        
    }
    
}
func justSwitch() {
    if isBlocked && isBlockedLeft || isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    }
  
}
