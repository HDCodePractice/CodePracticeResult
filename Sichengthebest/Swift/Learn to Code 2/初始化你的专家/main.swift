let expert = Expert()
func threeStepsThenBack() {
    for i in 1 ... 3 {
        expert.moveForward()
    }
    if expert.isOnGem {
        expert.collectGem()
        
    } else {
        expert.turnLockUp()
    }
    expert.turnLeft()
    expert.turnLeft()
    for i in 1 ... 3 {
        expert.moveForward()
    }
    expert.turnLeft()
}

for i in 1 ... 4 {
    threeStepsThenBack()
}
