let expert = Expert()
let character = Character()

func expertHelpingCharacter() {
    expert.turnLeft()
    for i in 1 ... 3 {
        expert.moveForward()
    }
    expert.turnRight()
    for i in 1 ... 2 {
        expert.moveForward()
    }
    expert.turnLeft()
    expert.turnLockDown()
    expert.turnLockDown()
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
    for i in 1 ... 3 {
        expert.moveForward()
    }
    expert.turnRight()
}
func expertHelpingCharacter2() {
    expert.turnLeft()
    for i in 1 ... 3
    {
        expert.moveForward()
    }
    expert.turnRight()
    
    for i in 1 ... 2 {
        expert.moveForward()
    }
    expert.turnLeft()
    expert.turnLockUp()
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
    for i in 1 ... 3 {
        expert.moveForward()
    }
    expert.turnRight()
}
func characterMovements() {
    character.moveForward()
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
    }
    if character.isOnClosedSwitch {
        character.toggleSwitch()
    }
}

expertHelpingCharacter()
characterMovements()
expertHelpingCharacter2()
characterMovements()
