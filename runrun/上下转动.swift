let expert = Expert()
let characte = Character()
var m = 0
for i in 1 ... 4 {
    expert.turnLock(up: true, numberOfTimes: 4)
    expert.turnRight()
}
while m<10||m<40{
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
    m+=1
    character.collectGem()
    if m==11 {
        character.turnRight()
        character.move(distance: 2)
        for i in 1 ... 4 {
            expert.turnLock(up: false, numberOfTimes: 3)
            expert.turnRight()
        }
    }
}
