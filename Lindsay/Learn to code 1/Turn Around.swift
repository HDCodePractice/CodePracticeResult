func gemTurn() {
        
        if isOnGem{
            collectGem()
        }     
        if isBlocked && isBlockedLeft {
            turnRight()
        }
        if isBlocked && isBlockedRight{
            turnLeft()
            
        }   
    }         
        


for i in 1 ... 7 {
    gemTurn()
    moveForward()
}
turnRight()
for i in 1...7{
    gemTurn()
    moveForward()
    
}
