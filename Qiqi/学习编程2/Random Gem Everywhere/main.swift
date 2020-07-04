var gemCounter = 0
let totalGems = randomNumberOfGems
while gemCounter != randomNumberOfGems {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        turnRight()
        turnRight()
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
        bluePortal.isActive = false
        pinkPortal.isActive = false
        for i in 1 ... 4 {
            moveForward()
        }
        turnRight()
        turnRight()
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
        bluePortal.isActive = true
        pinkPortal.isActive = true
    }
    moveForward()
}
