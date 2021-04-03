let switchCounter = numberOfSwitches
var gems = 0

while gems < switchCounter {
    if isOnGem {
        collectGem()
        gems += 1
    }
    if isBlocked {
        turnRight()
    }
    moveForward()
}
