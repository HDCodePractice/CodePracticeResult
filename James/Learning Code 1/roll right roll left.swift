moveForward()
for i in 1 ... 4 {
    while isBlocked && isBlockedLeft{
        collectGem()
        turnRight()
        moveForward()
        collectGem()
        for i in 1 ... 4 {
            moveForward()
        }
        turnLeft()
        moveForward()
    }
    while isOnClosedSwitch{
        toggleSwitch()
        turnLeft()
        moveForward()
        toggleSwitch()
        for i in 1 ... 5 {
            moveForward()
        }
        turnRight()
        moveForward()
    }
    
}
