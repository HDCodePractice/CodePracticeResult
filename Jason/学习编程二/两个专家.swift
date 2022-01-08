let expert1 = Expert()
let expert2 = Expert()
let expert3 = Expert()

world.place(expert1, atColumn: 0, row: 4)
world.place(expert2, atColumn: 3, row: 0)
world.place(expert3, atColumn: 6, row: 0)

expert1.turnLeft()
expert1.turnLeft()
expert2.turnLeft()
expert2.turnLeft()
expert3.turnLeft()
expert2.turnLockUp()
expert2.turnLockUp()
expert3.turnLockDown()
expert3.turnLockDown()
expert1.turnRight()
for i in 1 ... 7 {
    if expert1.isOnGem {
        expert1.collectGem()
        expert1.moveForward()
    } else if !expert1.isOnGem{
        expert1.moveForward()
    }
    
}
expert2.turnRight()
expert2.moveForward()
expert2.turnLeft()
expert2.turnLeft()
for i in 1 ... 5 {
    
    if expert2.isOnGem {
        expert2.collectGem()
        expert2.moveForward()
        
    } else if !expert2.isOnGem{
        expert2.moveForward()
    }
}

