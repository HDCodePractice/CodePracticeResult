let expert = Expert()
let character = Character()
func whenToMoveExpert() {
    while !expert.isBlocked {
        expert.moveForward()
    }
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
}
expert.turnLeft()
whenToMoveExpert()
expert.turnLeft()
expert.turnLockDown()
expert.turnLockDown()
character.moveForward()
character.moveForward()
character.collectGem()
expert.turnRight()
whenToMoveExpert()
whenToMoveExpert()
expert.turnLeft()
expert.turnLockUp()
character.moveForward()
character.moveForward()
character.toggleSwitch()