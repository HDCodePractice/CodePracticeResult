let expert = Expert()
func check() {
    while !expert.isBlocked {
        if expert.isOnGem {
            expert.collectGem()
        } else {
            expert.moveForward()
        }
    }
}
world.place(expert, atColumn: 1, row: 8)
check()
expert.turnLockDown()
expert.turnLeft()
check()
expert.turnLockUp()
expert.turnRight()
check()
