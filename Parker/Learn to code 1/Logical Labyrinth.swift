for i in 1 ... 8 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if isOnGem {
        collectGem()
       }
    }


SOLUTION WHERE BYTE DOES NOT GO BACK AFTER HE GETS THE LAST GEM:
  
for i in 1 ... 8 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        if i < 8 {
            turnLeft()
            turnLeft()
            moveForward()
            moveForward()
            turnRight()
        }
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if isOnGem {
        collectGem()
    }
}

ALTERNATIVE SOLUTION WHERE BYTE DOES NOT GO BACK AFTER HE GETS THE LAST GEM:

for i in 1 ... 7 {
    moveForward()
    if isOnGem && isOnClosedSwitch {
        toggleSwitch()
        collectGem()
        turnRight()
        moveForward()
        moveForward()
        collectGem()
        turnLeft()
        turnLeft()
        moveForward()
        moveForward()
        turnRight()
    } else if isOnClosedSwitch {
        toggleSwitch()
        turnLeft()
    } else if isOnGem {
        collectGem()
    }
}
moveForward()
if isOnGem && isOnClosedSwitch {
    toggleSwitch()
    collectGem()
    turnRight()
    moveForward()
    moveForward()
    collectGem()
    
} else if isOnClosedSwitch {
    toggleSwitch()
    turnLeft()
} else if isOnGem {
    collectGem()
}
