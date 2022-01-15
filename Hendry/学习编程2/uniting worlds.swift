let block1 = Block()
world.place(block1, atColumn: 3, row: 3)
while !isBlocked{
    moveForward()
    if isOnClosedSwitch {
        toggleSwitch()
    }
    if isBlocked&&isBlockedRight {
        turnLeft()
    }
    if isBlocked&&isBlockedLeft {
        turnRight()
    }
    }
