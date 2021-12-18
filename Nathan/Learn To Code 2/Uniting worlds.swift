let block1 = Block()

world.place(block1, atColumn: 3, row: 3)

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
