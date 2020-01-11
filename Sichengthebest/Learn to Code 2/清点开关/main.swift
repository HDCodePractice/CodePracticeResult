var gems = 0
var switches = 0

while !isOnClosedSwitch {
    if isBlocked {
        turnRight()
    }
    if isOnGem {
        collectGem()
        gems += 1
    }
    moveForward()
}
while switches < gems {
    if isBlocked {
        turnRight()
    }
    if isOnClosedSwitch {
        toggleSwitch()
        switches += 1
    }
    moveForward()
}
