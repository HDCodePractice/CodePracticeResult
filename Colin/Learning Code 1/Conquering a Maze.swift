func turnThings() {
    if isBlockedRight && isBlocked{
        turnLeft()
    } else if isBlockedRight {
        moveForward()
    } else {
        turnRight()
        moveForward()
    }
    }
while !isOnGem {
    turnThings()
}
collectGem()
