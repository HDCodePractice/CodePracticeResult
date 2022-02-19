let block = Block()
let block2 = Block()
let block3 = Block()
func togem() {
    moveForward()
    moveForward()
    toggleSwitch()
    turnRight()
    move(distance: 4)
    collectGem()
    turnLeft()
    turnLeft()
    move(distance: 4)
    turnRight()
    
    
}

world.place(block, atColumn: 2, row: 2)
world.place(block, atColumn: 2, row: 2)
togem()
world.place(block2, atColumn: 4, row: 2)
togem()

world.place(block3, atColumn: 6, row: 2)
world.place(block3, atColumn: 6, row: 2)
togem()
