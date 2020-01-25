func forFun() {
    moveForward()
    if isOnGem {
        collectGem()        
    }
    turnLeft()
    moveForward()
    if isOnGem {
        collectGem()     
    }
    turnLeft()
    moveForward()
    turnRight()   
}
for i in 1 ... 4 {
    forFun()    
}
