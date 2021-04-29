bluePortal.isActive = false
pinkPortal.isActive = false
func collectMove() {
    moveForward()
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    bluePortal.isActive = true
}
collectMove()
collectMove()
bluePortal.isActive = false
collectMove()
moveForward()
turnLeft()
turnLeft()
pinkPortal.isActive = true
collectMove()
