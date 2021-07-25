let totalGems = randomNumberOfGems
var gemCon = 0
func navigate () {
    while !isBlocked {
        moveForward()
        if isOnGem {
            collectGem()
            gemCon += 1
        }
    }
}
func turnOffPortals() {
    bluePortal.isActive = false
    pinkPortal.isActive = false
}
func turnOnPortals() {
    bluePortal.isActive = true
    pinkPortal.isActive = true
}
func turnAround() {
    turnRight()
    turnRight()
}
while gemCon < totalGems {
    navigate()
    turnAround()
    turnOffPortals()
    navigate()
    turnAround()
    turnOnPortals()
}
