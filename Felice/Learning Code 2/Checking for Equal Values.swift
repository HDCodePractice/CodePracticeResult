let switchCounter = numberOfSwitches
var gemCounter = 0
while gemCounter != switchCounter {
    moveForward()
    if isOnGem {
        collectGem()
        gemCounter = gemCounter + 1
    }
    if isBlocked {
        turnRight()
    }
}
