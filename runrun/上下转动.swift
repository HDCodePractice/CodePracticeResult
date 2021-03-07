let expert = Expert()
let characte = Character()
var gemCount = 0
for i in 1 ... 4 {
    expert.turnLock(up: true, numberOfTimes: 4)
    expert.turnRight()
}
while gemCount<3{
    if !character.isBlockedRight {
        character.turnRight()
    }
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
        gemCount+=1
    }
}
character.turnRight()
character.move(distance: 2)
for i in 1 ... 4 {
    expert.turnLock(up: false, numberOfTimes: 3)
    expert.turnRight()
}
while gemCount<7 {
    if !character.isBlockedRight{
        character.turnRight()
    }else if character.isBlocked {
        if character.isBlockedLeft {
            character.turnLeft()
            character.turnLeft()
        }else {
            character.turnLeft()
        }
    }
    character.moveForward()
    if character.isOnGem {
        character.collectGem()
        gemCount+=1
    }
}
