let expert = Expert()
let character = Character()
var m = 0
expert.turnLeft()
while m<15{
    expert.moveForward()
    m+=1
    if expert.isBlocked {
        expert.turnRight()
    }
    if m==5 {
        expert.turnLeft()
        expert.turnLockDown()
        expert.turnLockDown()
        expert.turnRight()
    }else if m==15 {
        expert.turnLeft()
        expert.turnLockUp()
    }
}
for i in 1 ... 4 {
    character.moveForward()
    character.collectGem()
    character.toggleSwitch()
}
