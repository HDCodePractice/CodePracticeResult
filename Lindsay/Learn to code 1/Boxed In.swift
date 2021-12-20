func loop2() {
    if isOnClosedSwitch {
        toggleSwitch()
        
    }else if isOnGem{
        collectGem()
    }
}

moveForward()
loop2()
turnLeft()


moveForward()

for i in 1 ... 3 {
    turnLeft()
    
    loop2()
    for i in 1 ... 2 {
        moveForward()
        loop2()
        
    }
    
}
