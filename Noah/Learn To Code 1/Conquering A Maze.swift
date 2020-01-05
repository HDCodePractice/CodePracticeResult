func CAMaze() {
    if isBlockedRight && isBlocked{
        turnLeft()
    } else if isBlockedRight{
            moveForward()
    } else {
        turnRight()
        moveForward()
    }
}

while !isOnGem {
    CAMaze()
}
if isOnGem {
    collectGem()
}
