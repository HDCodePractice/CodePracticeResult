for i in 1 ... 2 {
    let block = Block()
    world.place(block, atColumn: 6, row: 2)
}
let block1 = Block()
world.place(block1, atColumn: 4, row: 2)
for i in 1 ... 2 {
    let block2 = Block()
    world.place(block2, atColumn: 2, row: 2)
}
for i in 1 ... 3 {
    moveForward()
    moveForward()
    toggleSwitch()
    turnRight()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    collectGem()
    turnLeft()
    turnLeft()
    moveForward()
    moveForward()
    moveForward()
    moveForward()
    turnRight()
}
