let expert = Expert()
let character = Character()
}
func ninetyDegreeTurn() {
    while !expert.isBlocked {
        expert.moveForward()
    }
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
}

expert.turnLeft()
ninetyDegreeTurn()
expert.turnLeft()
expert.turnLockDown()
expert.turnLockDown()
character.moveForward()
character.moveForward()
character.collectGem()
expert.turnRight()
ninetyDegreeTurn()
ninetyDegreeTurn()
expert.turnLeft()
expert.turnLockUp()
character.moveForward()
character.moveForward()
character.toggleSwitch()
