func collectOrToggle() {
if isOnClosedSwitch {
  toggleSwitch()
} else if isOnGem{
collectGem()
}
}


func loop() {
    for i in 1 ... 2 {
        moveForward()
        moveForward()
        collectOrToggle()    }
    
}

loop()
turnLeft()
moveForward()
moveForward()
turnLeft()
loop()
turnRight()
moveForward()
turnRight()
loop()


