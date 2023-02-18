let expert = Expert()
var gem = 0
func side(){
    expert.moveForward()
    expert.moveForward()
    if expert.isOnGem{
        expert.collectGem()
        gem+=1
        expert.turnLockDown()
            
        
    }
    expert.turnLeft()
    expert.turnLeft()
    expert.moveForward()
    expert.moveForward()
    expert.turnRight()
    
}
for i in 1 ... 7 {
    side()
    if gem == 3{
        expert.moveForward()
        expert.moveForward()
        expert.moveForward()
        for i in 1 ... 3 {
            side()
        }
        
    }
    
    
}

