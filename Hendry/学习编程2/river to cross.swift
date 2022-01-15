let expert = Expert()
world.place(expert, facing: south, atColumn: 1, row: 8)
expert.collectGem()
func movecollect(distance: Int) {
    for i in 1 ... distance {
        expert.moveForward()
        expert.collectGem()
    }
}
movecollect(distance: 3)
expert.turnLockDown()
expert.turnLeft()
expert.moveForward()
expert.moveForward()
movecollect(distance: 2)
expert.turnLockUp()
expert.turnRight()
movecollect(distance: 1)
expert.moveForward()
movecollect(distance: 2)
