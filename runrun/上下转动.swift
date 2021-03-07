let expert = Expert()
let characte = Character()
var m = 0
for i in 1 ... 4 {
    expert.turnLock(up: true, numberOfTimes: 4)
    expert.turnRight()
}
while m<40{
    if !character.isBlockedRight{
        character.turnRight()
    }else if character.isBlocked {
        if character.isBlockedLeft {
            character.turnLeft()
            character.turnLeft()
        }else {
            character.turnLeft()
        }
    }else if m==11 {
        for i in 1 ... 4 {
            expert.turnLock(up: false, numberOfTimes: 3)
            expert.turnRight()
        }
    }
    character.moveForward()
    m+=1
    character.collectGem()
}
