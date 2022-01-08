world.place(Block(), atColumn: 2, row: 2)
while !isBlocked {
    moveForward()
    if isBlocked&&isBlockedLeft {
        turnRight()
    }else if isBlocked&&isBlockedRight {
        turnLeft()
    }
}
toggleSwitch()
