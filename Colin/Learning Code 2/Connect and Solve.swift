world.place(Block(), atColumn: 2, row: 2)
world.place(Block(), atColumn: 2, row: 2)
world.place(Block(), atColumn: 4, row: 2)
world.place(Block(), atColumn: 6, row: 2)
world.place(Block(), atColumn: 6, row: 2)
var gemCounter = 0
while gemCounter < 3{
    moveForward()
    if isOnClosedSwitch{
        toggleSwitch()
        turnRight()
    }else if isOnGem{
        collectGem()
        gemCounter+=1
        turnRight()
        turnRight()
    }
    if isBlocked {
        turnRight()
    }
}
