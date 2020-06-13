moveForward()
collectGem()
moveForward()
for i in 1 ... 5 {
    moveForward()
    if isOnGem && isBlockedLeft{
        turnRight()
        moveForward()
        moveForward()
        toggleSwitch()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    }
    collectGem()
}
