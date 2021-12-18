var gemCounter = 0
var switchC = 0
while !isOnOpenSwitch {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        turnRight()
    }
    if gemCounter != switchC {
        if isOnClosedSwitch {
            toggleSwitch()
            switchC += 1
        }
    }
    moveForward()
}
