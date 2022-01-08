func getGemSwitch() {
    if isOnClosedSwitch {
        toggleSwitch()
        
    }else if isOnGem{
        collectGem()
    }
}


moveForward()
getGemSwitch()
turnLeft()
moveForward()

for i in 1 ... 3 {
    turnLeft()
    getGemSwitch()
    for i in 1 ... 2 {
        moveForward()
        getGemSwitch()
        
    }
    
}
