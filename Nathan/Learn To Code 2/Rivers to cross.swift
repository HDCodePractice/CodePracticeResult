let expert = Expert()

world.place(expert, facing: south, atColumn: 1, row: 8)

func collectGemMoveForward() { 
    expert.collectGem()
    expert.moveForward()
}
for i in 1 ... 3 {
    collectGemMoveForward()
    
}
expert.turnLockDown()
expert.turnLeft()
collectGemMoveForward()
expert.move(distance: 2)
collectGemMoveForward()
expert.turnLockUp()
expert.turnRight()
collectGemMoveForward()
collectGemMoveForward()
expert.moveForward()
collectGemMoveForward()
collectGemMoveForward()
