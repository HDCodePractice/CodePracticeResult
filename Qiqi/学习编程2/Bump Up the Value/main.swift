var gemCounter = 0
while !isBlocked {
    moveForward()
    collectGem()
    gemCounter = gemCounter + 1
}
