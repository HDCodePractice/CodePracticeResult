bluePortal.isActive = false
pinkPortal.isActive = false
func collectGemAndMove() {
    moveForward()
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    bluePortal.isActive = true
}
collectGemAndMove()
collectGemAndMove()
bluePortal.isActive = false
collectGemAndMove()
moveForward()
turnLeft()
turnLeft()
pinkPortal.isActive = true
collectGemAndMove()
