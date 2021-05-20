var gemCounter = 0
let totalGems = randomNumberOfGems
func turnRightAgain() {
    turnRight()
    turnRight()
}
while gemCounter != randomNumberOfGems {
    if isOnGem {
        collectGem()
        gemCounter += 1
    }
    if isBlocked {
        turnRightAgain()
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
        bluePortal.isActive = false
        pinkPortal.isActive = false
        for i in 1 ... 4 {
            moveForward()
        }
        turnRightAgain()
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
        bluePortal.isActive = true
        pinkPortal.isActive = true
    }
    moveForward()
}
