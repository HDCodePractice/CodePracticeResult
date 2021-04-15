func first() {
    turnRight()
    for i in 1 ... 3 {
        moveForward()
    }
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
    turnRight()
    for i in 1 ... 3 {
        moveForward()
    }
    turnRight()
}

func second() {
    turnLeft()
    moveForward()
    collectGem()
    turnRight()
    turnRight()
    moveForward()
    turnLeft()
} 

for i in 1 ... 6 {
    if isOnGem {
        collectGem()
        first()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        second()
    }
    moveForward()
}
