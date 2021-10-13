func navigateAroundWall() {
    if isBlockedRight {
        moveForward()
    }  else {
        turnRight()
        moveForward()
    }
}
func turnAround() {
    turnRight()
    turnRight()
}
while !isOnGem {
    navigateAroundWall()
}
turnAround()
collectGem()
while !isOnGem {
    navigateAroundWall()
}
turnAround()
collectGem()
while !isOnGem {
    navigateAroundWall()
}
turnAround()
collectGem()
while !isOnClosedSwitch {
    navigateAroundWall()
}
toggleSwitch()
