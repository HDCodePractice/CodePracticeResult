let expert = Expert()
let character = Character()
expert.turnLeft()
for i in 1 ... 15 {
    expert.moveForward()
    if expert.isBlocked {
        expert.turnRight()
    }
    if i == 5 {
        expert.turnLeft()
        expert.turnLockDown()
        expert.turnLockDown()
        expert.turnRight()
    }
    if i == 15 {
        expert.turnLeft()
        expert.turnLockUp()
    }
}
for i in 1 ... 4 {
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
    } else{
        character.toggleSwitch()
    }
}
