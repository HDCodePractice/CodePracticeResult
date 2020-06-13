func collectGemAndToggle(){
    for i in 1...3 {
        if isOnGem {
            collectGem()
        } else if isOnClosedSwitch {
            toggleSwitch()
        }
    }
    
}
moveForward()
collectGemAndToggle()
turnLeft()
moveForward()
collectGemAndToggle()
turnLeft()
for i in 1...3{
    moveForward()
    collectGemAndToggle()
    moveForward()
    collectGemAndToggle()
    turnLeft()
}
