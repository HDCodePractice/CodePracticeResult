let totalGems = randomNumberOfGems
var gemCounter = 0
while !(gemCounter == totalGems) {
    moveForward  ()
    if isOnGem{
        collectGem()
        gemCounter += 1
    } 
    if !isBlockedLeft{
        turnLeft()
    }
    if isBlocked {
        turnRight()
    }
}
