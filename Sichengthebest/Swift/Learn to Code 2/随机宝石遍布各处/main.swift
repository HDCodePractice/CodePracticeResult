let totalGems = randomNumberOfGems
var gemCounter = 0
func check() {
    if pinkPortal.isActive == true || bluePortal.isActive == true {
        bluePortal.isActive = false
        pinkPortal.isActive = false
    }
}
func collectToTheEnd() {
    check()
    while !isBlocked {
        if isOnGem {
            collectGem()
            gemCounter += 1
        }
        moveForward()
        }
    turnRight()
    turnRight()
}

while gemCounter != totalGems {
    collectToTheEnd()
    collectToTheEnd()
    bluePortal.isActive = true
    moveForward()
    collectToTheEnd()
    collectToTheEnd()
    moveForward()
    bluePortal.isActive = true
    moveForward()
    moveForward()
    pinkPortal.isActive = true
    moveForward()
    collectToTheEnd()
    collectToTheEnd()
}
