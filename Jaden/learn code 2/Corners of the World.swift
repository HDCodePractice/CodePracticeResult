greenPortal.isActive = true
orangePortal.isActive = false
var gem = 0
var tog = 0
while gem<6{
    moveForward()
    if isBlocked && !isBlockedRight{
        turnRight()
        
    }
    if isOnClosedSwitch{
        toggleSwitch()
        tog+=1
    }
    if tog == 1{
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
        moveForward()
        toggleSwitch()
        tog+=1
        
    }
    if tog == 3{
        greenPortal.isActive = false
    }
    if tog == 4{
        turnLeft()
        turnLeft()
        moveForward()
        turnRight()
        moveForward()
        toggleSwitch()
        
    }
    if tog == 6{
        greenPortal.isActive = true
    }
    if isBlocked && !isBlockedLeft {
        turnLeft()
        
    }
    if isBlocked{
        turnLeft()
        turnLeft()
        
    }
    if isOnGem{
        gem += 1
        collectGem()
        
    }
    if gem == 2{
        moveForward()
        moveForward()
        moveForward()
        greenPortal.isActive = false
        moveForward()
        moveForward()
        collectGem()
        gem+=1
        tog+=1
    }
    if gem == 3{
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
        moveForward()
        collectGem()
        gem += 1
        turnLeft()
        turnLeft()
        moveForward()
        turnLeft()
        moveForward()
        moveForward()
        moveForward()
        turnRight()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        collectGem()
        gem += 2
    }

    
}
