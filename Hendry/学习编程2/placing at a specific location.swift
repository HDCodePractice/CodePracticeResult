let expert = Expert()
world.place(expert, atColumn: 1, row: 6)
func move(distance: Int) {
    for i in 1 ... distance {
        expert.moveForward()
    }
}
expert.collectGem()
expert.turnLeft()
move(distance: 1)
expert.turnLockUp()
expert.turnRight()
move(distance: 5)
expert.turnRight()
move(distance: 1)
expert.collectGem()
expert.turnRight()
expert.turnRight()
move(distance: 1)
expert.turnLockUp()
expert.turnRight()
move(distance: 1)
move(distance: 5)
expert.collectGem()
