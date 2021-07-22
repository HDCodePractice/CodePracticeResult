let switchCounter = numberOfSwitches
var gemCounter = 0
while gemCounter < switchCounter {
    while isOnGem {
        collectGem()
        gemCounter = gemCounter+1
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
}
