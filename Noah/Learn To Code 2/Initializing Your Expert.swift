let expert = Expert()

func line() {
    for i in 1 ... 3 {
        expert.moveForward()
    }
    if expert.isOnGem {
        expert.collectGem()
    } else {
        expert.turnLockUp()
    }
}

func gogogo() {
    expert.turnRight()
    expert.turnRight()
    for i in 1 ... 3 {
        expert.moveForward()
    }
}

for i in 1 ... 4 {
    line()
    gogogo()
    expert.turnLeft()
}
