func turnAroundGIP() {
    moveForward()
    collectGem()
    turnRight()
    turnRight()
}

bluePortal.isActive = false

pinkPortal.isActive = false

moveForward()
moveForward()
turnAroundGIP()
pinkPortal.isActive = true
moveForward()
turnRight()
turnRight()
turnAroundGIP()
moveForward()
bluePortal.isActive = true
moveForward()
bluePortal.isActive = false
turnAroundGIP()
moveForward()
turnAroundGIP()
