world.place(Block(), atColumn: 2, row: 2)
world.place(Block(), atColumn: 2, row: 2)
world.place(Block(), atColumn: 4, row: 2)
world.place(Block(), atColumn: 6, row: 2)
world.place(Block(), atColumn: 6, row: 2)
var gemCounter = 0
while gemCounter < 3 {
    if isOnClosedSwitch {
        toggleSwitch()
    } else if isOnGem {
        collectGem()
        gemCounter += 1
    } else {
        if !isBlockedRight {
            turnRight()
            moveForward()
        } else if isBlocked {
            turnLeft()
            turnLeft()
        } else {
            moveForward()
        }
    }
}
