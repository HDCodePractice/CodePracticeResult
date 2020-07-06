let expert = Expert()
let character = Character()
var gemCounter = 0
func beforeLife() {
    while gemCounter != 3 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
        }
        if character.isBlocked {
            if character.isBlocked && character.isBlockedRight && character.isBlockedLeft {
                character.turnLeft()
                character.turnLeft()
            } else if !character.isBlockedLeft {
                character.turnLeft()
            } else {
                character.turnRight()
            }
        }
        character.moveForward()
    }
}
func turnLock(up: Bool, numberOfTimes: Int){
    for i in 1 ... numberOfTimes {
        if up {
            expert.turnLockUp()
        } else {
            expert.turnLockDown()
        }
    }
}
func turnLockUpAndNavigate() {
    character.turnRight()
    character.turnRight()
    expert.turnLeft()
    turnLock(up: false, numberOfTimes: 3)
    character.move(distance: 7)
    expert.turnLeft()
    turnLock(up: false, numberOfTimes: 3)
    character.turnRight()
    character.moveForward()
    character.turnRight()
    character.moveForward()
    while gemCounter != 6 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1
        }
        if character.isBlocked {
            character.turnRight()
            character.turnRight()
        }
        character.moveForward()
        if !character.isBlockedRight && !character.isBlockedLeft {
            character.turnRight()
        }
    }
}
turnLock(up: true, numberOfTimes: 4)
expert.turnLeft()
turnLock(up: true, numberOfTimes: 4)
expert.turnLeft()
turnLock(up: true, numberOfTimes: 1)
expert.turnLeft()
turnLock(up: true, numberOfTimes: 1)
beforeLife()
turnLockUpAndNavigate()
character.turnRight()
character.turnRight()
character.moveForward()
character.turnLeft()
character.move(distance: 2)
character.turnLeft()
character.move(distance: 2)
character.collectGem()
