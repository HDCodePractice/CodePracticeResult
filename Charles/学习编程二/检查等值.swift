let switchCounter = numberOfSwitches
var gemCounter = 0
while gemCounter<switchCounter {
    if isBlocked {
        turnRight()
    } else{moveForward()
    }
    if isOnGem {
        collectGem()
        gemCounter=gemCounter+1
    }
} 


