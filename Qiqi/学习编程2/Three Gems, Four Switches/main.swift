var gemCounter = 0
var switchCounter = 0
func checkForTheRightWay() {
    if isBlocked && isBlockedLeft {
        turnRight()
    } else if isBlocked && isBlockedRight {
        turnLeft()
    } else {
        moveForward()
    }
}
while gemCounter < 3 {
    checkForTheRightWay()
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
}
while !isOnClosedSwitch {
    checkForTheRightWay()
} 
while switchCounter < 4 {
    checkForTheRightWay()
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    }    
}
