let expert = Expert()
world.place(expert, atColumn: 2, row: 6)
func turnAround(){
    expert.turnLeft()
    expert.turnLeft()
}
func turnLockCollectGem(){
    expert.turnLeft()
    expert.turnLockUp()
    turnAround()
    expert.moveForward()
    expert.collectGem()
    turnAround()
    expert.moveForward()
    expert.turnRight()
}
turnLockCollectGem()
expert.move(distance: 5)
turnLockCollectGem()

expert.move(distance: 6)
expert.collectGem()
