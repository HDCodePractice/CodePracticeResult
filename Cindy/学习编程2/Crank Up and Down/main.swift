let expert = Expert()
let character = Character()
func turnLock(up: Bool, numberOfTimes: Int) {
    for i in 1 ... numberOfTimes {
        if up == true{
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}
for i in 1...4{
    turnLock(up: true, numberOfTimes: 4)
    expert.turnLeft()
}
for i in 1...9{
    if character.isBlockedRight{
        if character.isBlocked {
            character.turnLeft()
        }
    } else{
        character.collectGem()
        character.turnRight()
    }
    character.moveForward()
}
for i in 1...4{
    turnLock(up: false, numberOfTimes: 3)
    expert.turnLeft()
}
character.turnLeft()
for i in 1...15{
    if character.isBlockedRight{
        if character.isBlocked {
            character.collectGem()
            character.turnLeft()
            character.turnLeft()
        }
    } else{
        character.turnRight()
    }
    character.moveForward()
}
character.collectGem()
