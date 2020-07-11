let switchCounter = numberOfSwitches
var gemCounter = 0
while gemCounter < switchCounter {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked{
        turnRight()
    }
    moveForward()
}
