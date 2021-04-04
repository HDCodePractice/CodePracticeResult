let expert = Expert()
var gemCounter = 0
func twoStepsThenBack() {
    expert.moveForward()
    expert.moveForward()
    expert.collectGem()
    gemCounter += 1
    if gemCounter == 3 {
        expert.turnLockDown()
    }
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
}

for i in 1 ... 3 {
    twoStepsThenBack()
}
for i in 1 ... 3 {
    expert.moveForward()
}
for i in 1 ... 2 {
    twoStepsThenBack()
}
expert.turnLeft()
twoStepsThenBack()
