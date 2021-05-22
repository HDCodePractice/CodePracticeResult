let expert = Expert()
world.place(expert, facing: south, atColumn: 1, row: 8)
func collectGemMove() { 
    expert.collectGem()
    expert.moveForward()
}
for i in 1 ... 3 {
    collectGemMove()
}
expert.turnLockDown()
expert.turnLeft()
collectGemMove()
expert.move(distance: 2)
collectGemMove()
expert.turnLockUp()
expert.turnRight()
collectGemMove()
collectGemMove()
expert.moveForward()
collectGemMove()
collectGemMove()
