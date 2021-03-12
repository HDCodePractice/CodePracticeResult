let expert = Expert()
world.place(expert, atColumn: 1, row: 8)
func moveMoreDistance(dist: Int) {
    for i in 1 ... dist {
        if expert.isOnGem {
            expert.collectGem()
        }
        expert.moveForward()
    }
}
moveMoreDistance(dist: 3)
expert.turnLockDown()
expert.turnLeft()
moveMoreDistance(dist: 4)
expert.turnLockUp()
expert.turnRight()
moveMoreDistance(dist: 5)
