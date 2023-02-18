let charecter = Character()
let expert = Expert()
world.place(charecter, facing: south, atColumn: 1, row: 8)
for i in 1 ... 4 {
    charecter.collectGem()
    charecter.moveForward()
}
world.place(expert, facing: east, atColumn: 4, row: 5)
for i in 1 ... 7 {
    expert.collectGem()
    expert.moveForward()
    if expert.isBlocked {
        expert.turnLockUp()
        expert.turnRight()
    }
}
