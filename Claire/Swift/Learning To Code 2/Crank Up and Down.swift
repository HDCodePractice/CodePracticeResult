let expert = Expert()
let character = Character()
var gemCounter = 0
func checkTheWall() {
    if !character.isBlockedLeft {
        character.turnLeft()
    } else if character.isBlocked {
        if character.isBlockedRight {
            character.turnLeft()
            character.turnLeft()
        } else {
            character.turnRight()
        }
    }
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
        gemCounter += 1
    }
}
expert.turnLock(up: true, numberOfTimes: 4)
character.move(distance: 2)
character.turnRight()
character.collectGem()
gemCounter += 1
character.move(distance: 1)
expert.turnLock(up: false, numberOfTimes: 3)
expert.turnRight()
expert.turnLock(up: true, numberOfTimes: 1)
expert.turnRight()
expert.turnLock(up: true, numberOfTimes: 1)
expert.turnRight()
expert.turnLock(up: true, numberOfTimes: 1)
while gemCounter != 5 {
    checkTheWall()
}
character.turnLeft()
character.turnLeft()
character.move(distance: 1)
character.turnRight()
expert.turnLock(up: true, numberOfTimes: 3)
character.moveForward()
character.collectGem()
character.turnLeft()
expert.turnLeft()
expert.turnLock(up: true, numberOfTimes: 3)
expert.turnLeft()
expert.turnLock(up: true, numberOfTimes: 3)
character.move(distance: 4)
character.collectGem()
