var gemCounter=0 
while !isBlocked {
    moveForward()
    if isOnGem{
        collectGem()
        gemCounter=gemCounter+1
    } 
    if isBlocked{
        turnRight()
    }
}
