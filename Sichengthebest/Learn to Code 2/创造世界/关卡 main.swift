let theSexyOne = Character(name: .byte)
for i in 0 ... 11 {
    world.removeAllBlocks(atColumn: 4, row: i)
    world.removeAllBlocks(atColumn: 5, row: i)
    world.place(Block(), atColumn: 1, row: i)
    world.place(Block(), atColumn: 1, row: i)
    world.place(Block(), atColumn: 1, row: i)
}
world.place(theSexyOne, facing: .north, atColumn: 0, row: 0)
world.removeAllBlocks(atColumn: 1, row: 6)
world.place(Block(), atColumn: 1, row: 6)
world.place(Portal(color: #colorLiteral(red: 0.5058823529411764, green: 0.33725490196078434, blue: 0.06666666666666667, alpha: 1.0)), atStartColumn: 2, startRow: 0 , atEndColumn: 11, endRow: 0)
world.place(Stair(), facing: .west, atColumn: 2, row: 6)
world.place(Block(), atColumn: 3, row: 6)
world.place(Stair(), facing: .south, atColumn: 3, row: 5)
world.place(Switch(open: false), atColumn: 3, row: 4)
world.place(Gem(), atColumn: 2, row: 5)
for i in 6 ... 11 {
    world.place(Block(), atColumn: i, row: 3)
    world.place(Block(), atColumn: i, row: 3)
    world.place(Block(), atColumn: i, row: 3)
}
for i in 1 ... 3 {
    world.place(Block(), atColumn: 11, row: 1)
    world.place(Block(), atColumn: 10, row: 1)
    world.place(Block(), atColumn: 7, row: 1)
    world.place(Block(), atColumn: 8, row: 1)
    world.place(Block(), atColumn: 8, row: 2)
    world.place(Block(), atColumn: 8, row: 4)
    world.place(Block(), atColumn: 8, row: 5)
    world.place(Block(), atColumn: 7, row: 5)
    world.place(Block(), atColumn: 6, row: 5)
    world.place(Block(), atColumn: 9, row: 5)
}
for i in 4 ... 11 {
    world.place(Block(), atColumn: 11, row: i)
    world.place(Block(), atColumn: 11, row: i)
    world.place(Block(), atColumn: 11, row: i)
}
for i in 6 ... 10 {
    world.place(Block(), atColumn: i, row: 7)
    world.place(Block(), atColumn: i, row: 7)
    world.place(Block(), atColumn: i, row: 7)
}
world.place(Switch(open: false), atColumn: 9, row: 0)
world.place(Gem(), atColumn: 11, row: 2)
world.place(Switch(open: false), atColumn: 6, row: 0)
world.place(Portal(color: #colorLiteral(red: 0.5058823529411764, green: 0.33725490196078434, blue: 0.06666666666666667, alpha: 1.0)), atStartColumn: 7, startRow: 2 , atEndColumn: 6, endRow: 4)
world.place(Portal(color: #colorLiteral(red: 0.5058823529411764, green: 0.33725490196078434, blue: 0.06666666666666667, alpha: 1.0)), atStartColumn: 7, startRow: 4 , atEndColumn: 6, endRow: 6)
world.place(Gem(), atColumn: 6, row: 4)
world.place(Switch(open: false), atColumn: 10, row: 6)
world.place(Gem(), atColumn: 9, row: 4)
for i in 7 ... 10 {
    for j in 8 ... 10 {
        world.removeAllBlocks(atColumn: i, row: j)
        world.place(Water(), atColumn: i, row: j)
    }
    
}
func letsHaveSomeFun() {
    if theSexyOne.isOnClosedSwitch {
        theSexyOne.toggleSwitch()
        theSexyOne.turnRight()
        while !theSexyOne.isBlocked {
            theSexyOne.moveForward()
        }
        theSexyOne.turnRight()
        while !theSexyOne.isOnGem {
            theSexyOne.moveForward()
        }
        theSexyOne.collectGem()
    }
}
theSexyOne.move(distance: 6)
theSexyOne.turnRight()
theSexyOne.move(distance: 3)
theSexyOne.turnRight()
theSexyOne.move(distance: 2)
letsHaveSomeFun()
theSexyOne.turnLeft()
theSexyOne.turnLeft()
theSexyOne.move(distance: 5)
theSexyOne.turnRight()
theSexyOne.move(distance: 2)
letsHaveSomeFun()
theSexyOne.turnLeft()
theSexyOne.turnLeft()
theSexyOne.move(distance: 2)
theSexyOne.turnLeft()
theSexyOne.move(distance: 2)
theSexyOne.turnRight()
theSexyOne.move(distance: 3)
letsHaveSomeFun()
theSexyOne.move(distance: 5)
letsHaveSomeFun()
