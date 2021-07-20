var gemCounter = 0
var switchCounter = 0
while switchCounter<gemCounter||gemCounter==0 {
    if isBlocked {
        turnRight()
    }else{moveForward()
    }
    if isOnGem {
        collectGem()
        gemCounter+=1
    } else if isOnClosedSwitch {
        toggleSwitch()
        switchCounter+=1
    }
}
