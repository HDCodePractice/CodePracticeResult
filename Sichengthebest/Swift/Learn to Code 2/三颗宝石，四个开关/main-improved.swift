var gemCounter = 0
var switchCounter = 0
func navigateAroundWall() {
    if isBlocked && isBlockedLeft {
        turnRight()
        
    } else if isBlocked && isBlockedRight {
        turnLeft()
        
    } else {
        moveForward()
    }
}

while gemCounter < 3 && switchCounter < 4 {
    navigateAroundWall()
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    }
}
while switchCounter < 4 {
    navigateAroundWall()
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    }    
}
