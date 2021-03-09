var m = 0
let block = Block()
let block1 = Block()
let block2 = Block()
let block3 = Block()
world.place(block, atColumn: 2, row: 2)
world.place(block1, atColumn: 2, row: 2)
world.place(block, atColumn: 4, row: 2)
world.place(block2, atColumn: 6, row: 2)
world.place(block3, atColumn: 6, row: 2)
while m < 28{
    turnRight()
        if isBlocked {
        if isBlockedLeft {
            turnLeft()
            turnLeft()
        }else {
            turnLeft()
        }
        }
    moveForward()
    m+=1
    collectGem()
    if isOnClosedSwitch {
        toggleSwitch()
    }
}
