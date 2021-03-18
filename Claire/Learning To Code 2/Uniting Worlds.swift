let block = Block()
world.place(block, atColumn: 3, row: 3)
while !isOnClosedSwitch {
    if isBlocked {
        if isBlockedLeft {
            turnRight()
        } else {
            turnLeft()
        }
    }
    moveForward()
}
toggleSwitch()
