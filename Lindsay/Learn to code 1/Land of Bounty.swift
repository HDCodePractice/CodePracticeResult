func tSwitchGem() {
    if isOnClosedSwitch {
        toggleSwitch()
        
    }else if isOnGem {
        collectGem()
    }
}

func turnAround() {
    if isBlocked && isBlockedLeft{
        turnRight()
        moveForward()
        turnRight()
        
    }
    if isBlocked && isBlockedRight{
        turnLeft()
        moveForward()
        turnLeft()
        
    }
    moveForward()
    
    
    
}

for i in 1 ... 12{
    turnAround()
    tSwitchGem()
}
turnLeft()
moveForward()
turnLeft()    

for i in 1 ... 5{
    turnAround()
    tSwitchGem()
}
