let expert = Expert()
let charecter = Character()
world.place(charecter, atColumn: 2, row: 6)
world.place(expert, atColumn: 2, row: 1)
expert.turnLeft()
charecter.turnRight()
charecter.moveForward()
charecter.collectGem()
expert.turnLockUp()
expert.turnRight()
expert.turnRight()
expert.moveForward()
expert.collectGem()
for i in 1 ... 2 {
    expert.turnLeft()
    expert.moveForward()
}
expert.turnRight()
expert.move(distance: 5)
expert.collectGem()
