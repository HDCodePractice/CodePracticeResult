bluePortal.isActive = false
pinkPortal.isActive = false
func forwardThenCollect() {
    moveForward()
    collectGem()
}
func turnAround() {
    turnLeft()
    turnLeft()
}

moveForward()
moveForward()
forwardThenCollect()
turnAround()
pinkPortal.isActive = true
moveForward()
turnAround()
forwardThenCollect()
turnAround()
moveForward()
bluePortal.isActive = true
moveForward()
forwardThenCollect()
turnAround()
bluePortal.isActive = false
moveForward()
forwardThenCollect()
