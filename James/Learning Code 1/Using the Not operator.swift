for i in 1 ... 6 {
    moveForward()
    if !isOnGem {
        turnLeft()
        moveForward()
        moveForward()
        turnLeft()
        collectGem()
        turnLeft()
        moveForward()
        moveForward()
    } else {
        collectGem()
    }
    }
