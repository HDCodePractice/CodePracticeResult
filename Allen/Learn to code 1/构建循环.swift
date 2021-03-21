let totalGems = randomNumberOfGems
let hdcola = Character()
greenPortal.isActive = false
bluePortal.isActive = false
yellowPortal.isActive = false
world.place(Block(), atColumn: 6, row: 0)
world.place(Block(), atColumn: 6, row: 3)
world.place(Block(), atColumn: 1, row: 0)
world.place(Block(), atColumn: 0, row: 2)
world.place(Block(), atColumn: 1, row: 3)
world.place(Block(), atColumn: 3, row: 3)
world.place(hdcola, atColumn: 7, row: 3)
for i in 1 ... 38 {
    if hdcola.isBlocked {
        hdcola.turnRight()
    }
    hdcola.moveForward()
    hdcola.collectGem()
}
