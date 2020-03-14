world.place(Stair(), facing: south, atColumn: 3, row: 3)

world.place(Stair(), facing: south, atColumn: 3, row: 1)

world.place(Stair(), facing: east, atColumn: 5, row: 4)

world.place(Stair(), facing: east, atColumn: 5, row: 6)

world.place(Stair(), facing: north, atColumn: 4, row: 7)

world.place(Stair(), facing: north, atColumn: 2, row: 7)

world.place(Stair(), facing: west, atColumn: 1, row: 6)

world.place(Stair(), facing: west, atColumn: 1, row: 4)

var switchCounter = 0

func rightHandRule() {
    while switchCounter != 9 {
        if !isBlockedRight {
            turnRight()
        }
        if isOnClosedSwitch {
            toggleSwitch()
            switchCounter += 1
        }
        if isBlocked {
            turnLeft()
        }
        moveForward()
    }
}

move(distance: 3)
rightHandRule()
    
for i in 0 ... 6 {
    for k in 0 ... 8 { 
        world.place(Expert(), atColumn: i, row: k)
    }
}
world.place(Expert(), atColumn: 1, row: 123)

for x in 0 ... 6 {
    for y in 0 ... 8 {
        world.place(Character(), atColumn: x, row: y)
    }
}

