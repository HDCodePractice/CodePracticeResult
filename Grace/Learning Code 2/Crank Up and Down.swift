let expert = Expert()
let character = Character()
var x =  0
for i in  1  ...  4 {
    expert.turnLock ( up : true , numberOfTimes : 4 )
    expert.turnRight ()
}
while x < 40 {
    if  !character.isBlockedRight {
        character.turnRight ()
    } else  if character.isBlocked {
        if character.isBlockedLeft {
            character.turnLeft ()
            character.turnLeft ()
        } else {
            character.turnLeft ()
        }
    } else  if x == 11 {
        for i in  1  ...  4 {
            expert.turnLock ( up : false , numberOfTimes : 3 )
            expert.turnRight ()
        }
    }
    character.moveForward ()
    x += 1
    character.collectGem ()
}
