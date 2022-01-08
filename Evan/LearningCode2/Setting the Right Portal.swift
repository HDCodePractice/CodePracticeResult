bluePortal.isActive = false
pinkPortal.isActive = false
func turnAround() {
    turnLeft()
    turnLeft()
}

while !isOnGem {
    moveForward()
}
collectGem()
turnAround()
pinkPortal.isActive = true
moveForward()
turnAround()
moveForward()
collectGem()
turnAround()
moveForward()
bluePortal.isActive = true
moveForward()
moveForward()
collectGem()
turnAround()
bluePortal.isActive = false
moveForward()
moveForward()
collectGem()
