let expert = Expert()
let character = Character()
var gemCounter = 0
for i in 1...4 {
    expert.turnLock(up: true, numberOfTimes: 4)
    expert.turnLeft()
}
func checkGem() {
    if character.isOnGem {
        character.collectGem()
        gemCounter = gemCounter + 1
    } 
}
while gemCounter < 3 {
    character.move(distance: 2)
    if !character.isBlockedRight {
        character.turnRight()
    }
    checkGem()
}
character.moveForward()
for i in 1...4 {
    expert.turnLock(up: false, numberOfTimes: 3)
    expert.turnLeft()
}
character.turnLeft()
character.moveForward()
checkGem()
while gemCounter < 7 {
    if !character.isBlockedRight {
        character.turnRight()
    } else if character.isBlocked {
        character.turnLeft()
        character.turnLeft()
    }
    character.move(distance: 2)
    checkGem()
}
