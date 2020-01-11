let expert = Expert()
func move(distance: Int) {
    for i in 1 ... distance {
        expert.moveForward()
    }
}

move(distance: 6)
expert.turnRight()
move(distance: 2)
expert.turnRight()
move(distance: 5)
expert.turnLeft()
move(distance: 5)
expert.turnLeft()
expert.turnLockUp()
expert.turnLeft()
move(distance: 3)
expert.turnRight()
move(distance: 3)
expert.turnRight()
move(distance: 4)
expert.collectGem()
