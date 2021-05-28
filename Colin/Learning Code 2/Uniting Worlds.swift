let block = Block()
world.place(block, atColumn: 3, row: 3)
while !isOnClosedSwitch{
    moveForward()
    if isBlocked && isBlockedRight{
        turnLeft()
    }
    if isBlocked && isBlockedLeft{
        turnRight()
    }
}
toggleSwitch()
