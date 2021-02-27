let expert = Expert()
var gemCounter = 0
world.place(expert, facing: .south, atColumn: 1, row: 8)
while gemCounter<9 {
    if expert.isOnGem {
        expert.collectGem()
        gemCounter+=1
    }
    if expert.isBlocked {
        if gemCounter<5 {
            expert.turnLockDown()
            expert.turnLeft()
        }else{
            expert.turnLockUp()
            expert.turnRight()
        }
        
    }
    expert.moveForward()
}
