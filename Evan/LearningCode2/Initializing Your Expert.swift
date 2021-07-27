let expert = Expert()
for i in 1 ... 3 {
    expert.moveForward()
}
expert.turnLockUp()
expert.turnLeft()
expert.turnLeft()
while !expert.isOnGem {
    expert.moveForward()
}
expert.collectGem()
expert.turnRight()
expert.turnRight()
for i in 1 ... 3 {
    expert.moveForward()
}
expert.turnLeft()
while !expert.isOnGem {
    expert.moveForward()
}
expert.collectGem()
expert.turnLeft()
expert.turnLeft()
while !expert.isOnGem {
    expert.moveForward()
}
expert.collectGem()
