var gemCount = 0
for i in 1 ... 9 {
    moveForward()
    if isOnGem {
        collectGem()
        gemCount += 1
    }
    if isBlocked {
        turnRight()
    }
}
var switchCount = 0
for i in 1 ... 9 {
    moveForward()
    if isOnClosedSwitch{
        toggleSwitch()
        switchCount += 1
    }
    if isBlocked {
        turnRight()
    }
}
