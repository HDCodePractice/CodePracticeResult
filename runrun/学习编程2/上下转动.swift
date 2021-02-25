let expert=Expert()
let character=Character()
func go() {
    character.moveForward()
    character.moveForward()
    character.collectGem()
}
func get() {
    for i in 1 ... 4 {
        expert.turnLockUp()
    }
}
func turnLeft() {
    character.turnLeft()
    character.turnLeft()
}
func down() {
    for i in 1 ... 3 {
        expert.turnLockDown()
    }
}
go()
character.turnRight()
get()
go()
expert.turnRight()
get()
character.turnRight()
go()
expert.turnRight()
get()
go()
expert.turnRight()
get()
character.turnRight()
character.moveForward()
down()
character.turnLeft()
character.moveForward()
character.collectGem()
turnLeft()
go()
character.turnRight()
expert.turnLeft()
down()
go()
turnLeft()
go()
character.turnRight()
go()
expert.turnLeft()
down()
character.turnRight()
go()
turnLeft()
expert.turnLeft()
down()
go()
character.turnRight()
go()
