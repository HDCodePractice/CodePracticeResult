let block1 = Block()
world.place(block1, atColumn: 3, row: 3)
while !isOnClosedSwitch {
    moveForward()
    if isBlocked {
        turnLeft()
        if isBlocked {
            turnRight()
            turnRight()
        }
    }
}
toggleSwitch()
