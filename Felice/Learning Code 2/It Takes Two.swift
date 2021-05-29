let expert = Expert ()
let character = Character ()
var x =  0
expert.turnLeft ()
while x < 17 {
    expert.moveForward ()
    x += 1
    if expert.isBlocked {
        expert.turnRight ()
    }
    if x == 5 {
        expert.turnLeft ()
        expert.turnLockDown ()
        expert.turnLockDown ()
        expert.turnRight ()
        character.moveForward ()
        character.moveForward ()
        character.collectGem ()
    } else if x == 15 {
        expert.turnLeft ()
        expert.turnLockUp ()
        character.moveForward ()
        character.moveForward ()
        character.toggleSwitch()
    }
}
