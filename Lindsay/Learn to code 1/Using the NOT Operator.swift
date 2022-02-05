func judgeGem() {
    if !isOnGem {
        moveForward()
    }   else{
        collectGem()
        moveForward()}
}

func judgeBlock(){
    if isBlocked{
        turnLeft()
        moveForward()
        turnRight()
        
    }else{
        for i in 1 ... 3 {
            if !isOnGem {
                moveForward()
            }   else{
                collectGem()
                
            }
        }
    }
}

moveForward()
for i in 1 ... 3 {
    judgeGem()
}
if isOnGem {
    collectGem()
}  
turnLeft()
for i in 1 ... 4 {
    judgeBlock()
}
