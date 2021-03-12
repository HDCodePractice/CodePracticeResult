let expert = Expert()
world.place(expert, atColumn: 1, row: 8)
func moveDist(dist: Int ) {
    for i in 1 ... dist {
        expert.collectGem()
        expert.moveForward()
    }
}
moveDist(dist: 3)
expert.turnLockDown()
expert.turnLeft()
moveDist(dist: 4)
expert.turnLockUp()
expert.turnRight()
moveDist(dist: 5)
