func searchForTheWay() {
    if isBlockedRight && !isBlocked {
        moveForward()
    } else if isBlockedRight && isBlocked {
        turnLeft()
    } else {
        turnRight()
        moveForward()        
    }
}
while !isOnGem {
    searchForTheWay()
}
collectGem()
