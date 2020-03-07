let expert = Expert()
let character = Character()

var gemCounter = 0

func characterNavigateAroundWall() {
    while gemCounter != 2 {
        if character.isOnGem {
            character.collectGem()
            gemCounter += 1 
        }
        if !character.isBlockedRight && !character.isBlocked {
            character.turnRight()
        }
        if character.isBlocked && !character.isBlockedRight {
            expert.turnLockDown()
            expert.turnLockDown()
        }
        character.moveForward()
    }
}
expert.moveForward()
expert.turnLockUp()
characterNavigateAroundWall()
