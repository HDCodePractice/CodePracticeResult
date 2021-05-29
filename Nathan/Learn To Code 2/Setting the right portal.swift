func moveCollect() {
    moveForward()
    collectGem()
}
func turnAround() {
    turnLeft()
    turnLeft()
}
moveForward()
moveCollect()
turnAround()
bluePortal.isActive = false
moveForward()
moveCollect()
turnAround()
bluePortal.isActive = true
pinkPortal.isActive = false
moveForward()
moveForward()
moveCollect()
turnAround()
pinkPortal.isActive = true
moveForward()
turnAround()
moveCollect()
