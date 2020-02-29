var gemCount = 0
var openSwitchCount = 0
while openSwitchCount < 4 {
    while gemCount < 3 {
        moveForward()
        if isBlocked && isBlockedLeft {
            turnRight()
        }
        if isBlocked && isBlockedRight {
            turnLeft() 
        }
        if isOnGem {
            collectGem()
            gemCount += 1
        }      
    }
    moveForward()
    if isBlocked && isBlockedLeft {
        turnRight()
    }
    if isBlocked && isBlockedRight {
        turnLeft() 
    }
    if isOnClosedSwitch {
        toggleSwitch()
        openSwitchCount += 1
    }  
}
