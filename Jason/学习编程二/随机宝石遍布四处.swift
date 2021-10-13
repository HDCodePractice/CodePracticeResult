let totalGems = randomNumberOfGems
var gem = 0

func toveback() {
    
        moveForward()
        if isOnGem{
            collectGem()
            gem+=1
        } else if !isOnGem{
            moveForward()
        }
    }
    


func a() {
    turnLeft()
    turnLeft()
}

while gem < totalGems {
    moveForward()
    moveForward()
    for i in 1 ... 2 {
        if isOnGem {
            collectGem()
            gem+=1
            moveForward()
        } else if !isOnGem{
            moveForward()
        }
    }
    a()
    moveForward()
    pinkPortal.isActive=false
    moveForward()
    moveForward()
    for i in 1 ... 2 {
        if isOnGem {
            collectGem()
            gem+=1
            moveForward()
        } else if !isOnGem{
            moveForward()
        }
    }
    a()
    moveForward()
    pinkPortal.isActive=true
    moveForward()
    moveForward()
    if isOnGem {
        collectGem()
        gem+=1
        moveForward()
    } else if !isOnGem{
        moveForward()
    }
    a()
    pinkPortal.isActive=false
    moveForward()
    moveForward()
    if isOnGem {
        collectGem()
        gem+=1
        moveForward()
    } else if !isOnGem{
        moveForward()
    }
    moveForward()
    moveForward()
    for i in 1 ... 2 {
        if isOnGem {
            collectGem()
            gem+=1
            moveForward()
        } else if !isOnGem{
            moveForward()
        }
    }
    a()
    moveForward()
    bluePortal.isActive=false
    moveForward()
    moveForward()
    for i in 1 ... 2 {
        if isOnGem {
            collectGem()
            gem+=1
            moveForward()
        } else if !isOnGem{
            moveForward()
        }
    }
    a()
    moveForward()
    bluePortal.isActive=true
    moveForward()
    moveForward()
    if isOnGem {
        collectGem()
        gem+=1
        moveForward()
    } else if !isOnGem{
        moveForward()
    }
}
