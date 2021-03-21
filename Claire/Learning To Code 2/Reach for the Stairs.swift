world.place(Stair(), facing: south, atColumn: 3, row: 1)
world.place(Stair(), facing: south, atColumn: 3, row: 3)
world.place(Stair(), facing: east, atColumn: 5, row: 4)
world.place(Stair(), facing: east, atColumn: 5, row: 6)
world.place(Stair(), facing: north, atColumn: 4, row: 7)
world.place(Stair(), facing: north, atColumn: 2, row: 7)
world.place(Stair(), facing: west, atColumn: 1, row: 6)
world.place(Stair(), facing: west, atColumn: 1, row: 4)
func moveAround() {
    if isBlocked {
        turnLeft()
    } else if !isBlockedRight {
        turnRight()
        moveForward()
    } else {
        moveForward()
    }
}
var switchCounter = 0
move(distance: 4)
turnRight()
move(distance: 2)
while switchCounter < 9 {
    if isOnClosedSwitch {
        toggleSwitch()
        switchCounter += 1
    } else {
        moveAround()
    }
    
}
