let expert = Expert()
var gemCounter = 0
for i in 1 ... 6 {
    expert.moveForward()
    expert.moveForward()
    expert.collectGem()
    gemCounter+=1
    if i==3 {
        expert.turnLockDown()
    }
    expert.turnRight()
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
    if i==3 {
        expert.moveForward()
        expert.moveForward()
        expert.moveForward()
        expert.turnRight()
        
    }
    
}
