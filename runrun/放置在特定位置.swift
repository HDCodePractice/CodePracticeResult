let expert = Expert()
world.place(expert, atColumn: 2, row: 6)
func zhowei() {
    expert.turnLeft()
    expert.turnLeft()
}
func zhoweisho() {
    expert.turnLeft()
    expert.turnLockUp()
    zhowei()
    expert.moveForward()
    expert.collectGem()
    zhowei()
    expert.moveForward()
    expert.turnRight()
}
zhoweisho()
expert.move(distance: 5)
zhoweisho()
expert.move(distance: 6)
expert.collectGem()
