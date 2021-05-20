let expert = Expert()
var gemCounter =  0
func  moveAndCollectGem() {
    expert.moveForward()
    expert.moveForward()
    expert.collectGem ()
    gemCounter +=  1
    if gemCounter ==  3 {
        expert.turnLockDown()
    }
    expert.turnRight()
    expert.turnRight()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
}
for i in  1  ...  3 {
    moveAndCollectGem()
}
for i in  1  ...  3 {
    expert.moveForward()
}
moveAndCollectGem()
moveAndCollectGem()
expert.turnLeft()
moveAndCollectGem()
