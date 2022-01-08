let totalGems = randomNumberOfGems
var totalGemsCollected = 0
pinkPortal.isActive = false
moveForward()
moveForward()
if isOnGem {
    collectGem()
    totalGemsCollected += 1
}
turnRight()
turnRight()
moveForward()
moveForward()
bluePortal.isActive = false
moveForward()
moveForward()
if isOnGem {
    collectGem()
    totalGemsCollected += 1
}
turnLeft()
turnLeft()
moveForward()
moveForward()
if isOnGem {
    collectGem()
    totalGemsCollected += 1
}
pinkPortal.isActive = true
bluePortal.isActive = true
while totalGemsCollected < totalGems {
    if isBlocked {
        turnLeft()
        turnLeft()
        pinkPortal.isActive = false
        bluePortal.isActive = false
    }
    moveForward()
    if isOnGem {
        collectGem()
        totalGemsCollected += 1
    }
}
