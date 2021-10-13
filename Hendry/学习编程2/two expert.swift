let expert1 = Expert()
let expert2 = Expert()
world.place(expert1, facing: east, atColumn: 0, row: 0)
world.place(expert2, facing: north, atColumn: 0, row: 4)
while expert1.isOnGem {
    expert1.collectGem()
if expert2.isOnGem {
    expert2.collectGem()
}
}
    func move1(distance: Int) {
    for i in 1 ... distance {
        if expert1.isOnGem {
            expert1.collectGem()
        }
        expert1.moveForward()
    } 
}
func move2(distance: Int) {
    for i in 1 ... distance {
        if expert2.isOnGem {
            expert2.collectGem()
        } 
        expert2.moveForward()
    }
}
move1(distance: 3)
expert1.turnLeft()
expert1.turnLockUp()
expert1.turnLockUp()
expert2.turnLockDown()
expert1.turnRight()
move1(distance: 3)
expert1.turnLockDown()
expert1.turnLockDown()
expert2.turnRight()
move2(distance: 7)
