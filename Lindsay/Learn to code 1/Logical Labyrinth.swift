for i in 1 ... 8{
    moveForward()
    gemSwitch()
    justGemorSwitch()
}

    

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
        
        
    }
    
}

func justGemorSwitch() {
    if isBlocked && isBlockedLeft || isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    
    }
    if isOnGem  {
        collectGem()
    }
}



